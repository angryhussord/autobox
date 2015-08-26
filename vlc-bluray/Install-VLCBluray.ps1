Write-Output "Installing AACS support for VLC";
#Download and install AACS support
#Assuming VLC is 64-bit if the OS is 64-bit
$osarch = (Get-WmiObject -class win32_operatingsystem).OSArchitecture;
switch ($osarch) {
	'64-bit' {$url = "http://vlc-bluray.whoknowsmy.name/files/win64/libaacs.dll";}
	'32-bit' {$url = "http://vlc-bluray.whoknowsmy.name/files/win32/libaacs.dll";}
}
#Download libaacs.dll
$path = (Get-Location).Path + "\libaacs.dll";
$client = new-object System.Net.WebClient;
Write-Output "Downloading libaacs..."
$client.DownloadFile( $url, $path );
#Find the VLC install path and copy libaacs.dll to that directory
$vlc_path = (Get-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | ? {$_.DisplayName -eq "VLC media player"}).InstallLocation;
xcopy $path $vlc_path /Y | Out-Null;
Write-Output "...libaacs installed!";
#Clean up after ourselves...
Remove-Item $path;

#Download the KEYDB.cfg file
$url = "http://vlc-bluray.whoknowsmy.name/files/KEYDB.cfg"
$path = (Get-Location).Path + "\KEYDB.cfg";
$client = new-object System.Net.WebClient;
Write-Output "Downloading key database...";
$client.DownloadFile( $url, $path );
#Find the %appdata% directory, if it doesn't exist, create it and copy the KEYDB over
$appdatapath = $env:appdata + "\aacs\";
if (-not (Test-Path $appdatapath)) {
	mkdir $appdatapath;
}
xcopy $path $appdatapath /Y | Out-Null;
Write-Output "...key database installed!";
#Clean up after ourselves...
Remove-Item $path;

Write-Output "AACS support for VLC install complete.";

Write-Output "Installing BD+ Support for VLC";
#Download and install BD+ Support
$url = "http://www.labdv.com/aacs/libaacs/win32/libbdplus.dll"
$path = (Get-Location).Path + "\libbdplus.dll";
$client = new-object System.Net.WebClient;
Write-Output "Downloading libbdplus...";
$client.DownloadFile( $url, $path );
xcopy $path $vlc_path /Y | Out-Null;;
Write-Output "...libbdplus installed!";
#Clean up after ourselves...
Remove-Item $path;

$url = "http://www.labdv.com/aacs/libaacs/keydb.bz2"
$path = (Get-Location).Path + "\keydb.bz2";
$client = new-object System.Net.WebClient;
Write-Output "Downloading key database...";
$client.DownloadFile( $url, $path );

$appdatapath = $env:appdata + "\bdplus\";
#Find the %appdata% directory, if it doesn't exist, create it and copy the KEYDB over
if (-not (Test-Path $appdatapath)) {
	mkdir $appdatapath;
}
xcopy $path $appdatapath /Y | Out-Null;
Write-Output "...key database installed!";
#Clean up after ourselves...
Remove-Item $path;
Write-Output "BD+ support for VLC install complete.";