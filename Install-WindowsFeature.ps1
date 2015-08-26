param (
	[string]$FeatureName
)
$exist = .\Get-WindowsFeatures.ps1 | ? {$_.Name -eq $FeatureName};
if ($exist) {
	dism /online /Enable-Feature /FeatureName:$FeatureName | Out-Null;
} else {
	Write-Error "Could not find that feature on this system.";
}