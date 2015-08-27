<#
.SYNOPSIS
    Installs BitDefender Total Security 2015
    Author: Patrick Hufford (angryhussord@outlook.com)

.DESCRIPTION
    Installs BitDefender from the public download URL. This version is meant for Windows 10 x64 only.
.PARAMETER None

.EXAMPLE 
    .\Install-BitDefender.ps1

.INPUTS

.OUTPUTS

.LINK
 
    https://github.com/angryhussord/
#>

. ..\Download-File.ps1

#Download Installer for Windows 10 x64
$url = "http://download.bitdefender.com/windows/desktop/t_security/2015w10/en-us/bitdefender_ts_19_64b.exe"
$path = (Get-Location).Path"; 
Download-File $url  $path;
$cmd = $path + 'bitdefender_ts_19_64b.exe' + " /s";
Invoke-Expression $cmd;

$url = "http://download.bitdefender.com/updates/bitdefender_2015/x64/weekly.exe";
$path = (Get-Location).Path"; 
Download-File $url  $path;
$cmd = $path + 'weekly.exe' + " /s";
Invoke-Expression $cmd;