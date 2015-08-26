[CmdletBinding()] 
param ( 
	[parameter(ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)] 
	[Alias('name')] 
	$computername=$env:computername
)

#Source: http://blog.powershell.no/2011/06/12/use-windows-powershell-to-get-antivirus-product-information/
#Resource: http://www.neophob.com/2010/03/wmi-query-windows-securitycenter2/
#Modifications by Patrick Hufford (2015)

$products = @();
$products += Get-WmiObject -Namespace root\SecurityCenter2 -Class AntiVirusProduct -ComputerName $computername;
$products += Get-WmiObject -Namespace root\SecurityCenter2 -Class AntiSpywareProduct -ComputerName $computername;
$products += Get-WmiObject -Namespace root\SecurityCenter2 -Class FirewallProduct -ComputerName $computername;


$av_products = @();
foreach ($av in $products) {

	$num = $av.productState;
	$hex = [Convert]::ToString($num, 16);
	if (($hex.Length % 2) -eq 1) {
		#add leading zero
		$hex = '0' + $hex;
	}
	[int[]]$bytes = $hex -replace '^0x', '' -split "(?<=\G\w{2})(?=\w{2})" | %{ [Convert]::ToByte($_, 16) }

	switch($bytes[0]) {
		'1'  {$producttype = 'Firewall'; $autoupdate = $false;}
		'3'  {$producttype = 'Firewall'; $autoupdate = $true;}
		'4'  {$producttype = 'Antivirus'; $autoupdate = $false;}
		'6'  {$producttype = 'Antivirus'; $autoupdate=$true;}
		'8'  {$producttype = 'AntiSpyware'; $autoupdate = $false;}
		'10'  {$producttype = 'AntiSpyware'; $autoupdate=$true;}
		default   {$producttype = 'Unknown'; $autoupdate='Unknown';}
	}

	switch($bytes[1]) {
		'1'  {$rtstatus = $false;}
		'16' {$rtstatus = $true;}
	}

	switch($bytes[2]) {
		'0'  {$defstatus = $true;}
		'16' {$defstatus = $false;}
	}

	$av_product = New-Object PSObject;
	Add-Member -InputObject $av_product -MemberType NoteProperty -Name instanceGuid -Value $av.instanceGuid;
	Add-Member -InputObject $av_product -MemberType NoteProperty -Name Name -Value $av.displayName;
	Add-Member -InputObject $av_product -MemberType NoteProperty -Name ProductType -Value $av.__CLASS.Split("P")[0];
	Add-Member -InputObject $av_product -MemberType NoteProperty -Name PathToScanner -Value $av.pathToSignedProductExe;
	Add-Member -InputObject $av_product -MemberType NoteProperty -Name PathToReporter -Value $av.pathToSignedReportingExe;
	Add-Member -InputObject $av_product -MemberType NoteProperty -Name DefinitionsUpdated -Value $defstatus;
	Add-Member -InputObject $av_product -MemberType NoteProperty -Name Enabled -Value $rtstatus;
	Add-Member -InputObject $av_product -MemberType NoteProperty -Name AutoUpdate -Value $autoupdate;
	Add-Member -InputObject $av_product -MemberType NoteProperty -Name LastUpdate -Value $av.timestamp;
	Add-Member -InputObject $av_product -MemberType NoteProperty -Name ComputerName -Value $av.PSComputerName;
	
	$av_products += $av_product;
}		

return $av_products;