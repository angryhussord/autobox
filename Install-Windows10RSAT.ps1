<#
.SYNOPSIS
    Download and install the Remote Server Administration Tools for Windows 10
    Author: Patrick Hufford (angryhussord@outlook.com)
 
.DESCRIPTION
    Downloads and installs the RSAT tools for Windows 10.
 
.PARAMETER None

.EXAMPLE
    .\InstallWindows10RSAT.ps1 
 
.INPUTS
    None
.OUTPUTS
    None

.LINK
    https://github.com/angryhussord/
#>

. .\Download-File.ps1
[System.Uri]$url = "http://download.microsoft.com/download/1/D/8/1D8B5022-5477-4B9A-8104-6A71FF9D98AB/WindowsTH-KB2693643-x64.msu"
$path = (Get-Location).Path + "\";
$filename = $url.AbsolutePath.Split("/")[$url.AbsolutePath.Split("/").count-1];
Download-File $url $path;
$path = $path + $filename;
Start-Process -FilePath $path -Wait -ArgumentList "/quiet /norestart"
Write-Output "Installation complete. Please reboot your computer for changes to take effect."

#Cleaning up after ourselves...
Remove-Item $path;