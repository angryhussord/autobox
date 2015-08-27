<#
.SYNOPSIS
    Downloads and installs VLC Blu-ray support.
    Author: Patrick Hufford (angryhussord@outlook.com)

.DESCRIPTION
    Downloads and installs VLC Blu-ray support from whoknowsmyname.com and
    BD+ support www.labdv.com and installs the files in the appropriate locations. 
    The install will fail if it can't detect an installation of VLC.

.PARAMETER None

.EXAMPLE
    .\InstallVLCBluray.ps1

.INPUTS

.OUTPUTS

.LINK
 
    https://github.com/angryhussord/
#>

. ..\Download-File.ps1
$osarch = (Get-WmiObject -class win32_operatingsystem).OSArchitecture;
switch ($osarch) {
	'64-bit' {[System.Uri]$url = "http://vlc-bluray.whoknowsmy.name/files/win64/libaacs.dll";}
	'32-bit' {[System.Uri]$url = "http://vlc-bluray.whoknowsmy.name/files/win32/libaacs.dll";}
}

$path = (Get-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | ? {$_.DisplayName -eq "VLC media player"}).InstallLocation;
if ($path -eq $null) {
	Write-Error "VLC is not installed on this system. Please install VLC and then try again.";
	return;
}

Write-Output "Installing AACS support for VLC";
Write-Output "Downloading libaacs..."
Download-File $url $path;
Write-Output "...libaacs installed!";

#Download the KEYDB.cfg file
$url = "http://vlc-bluray.whoknowsmy.name/files/KEYDB.cfg"
$path = $env:appdata + "\aacs\";
if (-not (Test-Path $path)) {
	mkdir $path | Out-Null;
}

Write-Output "Downloading key database...";
Download-File $url $path;
Write-Output "...key database installed!";
Write-Output "AACS support for VLC install complete.";

Write-Output "Installing BD+ Support for VLC";
#Download and install BD+ Support
$url = "http://www.labdv.com/aacs/libaacs/win32/libbdplus.dll"
$path = (Get-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | ? {$_.DisplayName -eq "VLC media player"}).InstallLocation;

Write-Output "Downloading libbdplus...";
Download-File $url $path;
Write-Output "...libbdplus installed!";

$url = "http://www.labdv.com/aacs/libaacs/keydb.bz2"
$path = $env:appdata + "\bdplus\";
if (-not (Test-Path $path)) {
	mkdir $path | Out-Null;
}
Write-Output "Downloading key database...";
Download-File $url $path;
Write-Output "...key database installed!";
Write-Output "BD+ support for VLC install complete.";