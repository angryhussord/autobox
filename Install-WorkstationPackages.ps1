<#
.SYNOPSIS
    Installs listed chocolatey packages.
    Author: Patrick Hufford (angryhussord@outlook.com)
 
.DESCRIPTION
    Given a text file input of packages, one on a line (including the -version) this will run through each package in the list and install it.
 
.PARAMETER PackageList
 
    The text file that contains the list of packages (and -version) of each package you wish to install.
 
.EXAMPLE
 
    .\Install-WorkstationPackages.ps1 Workstation-Packages.txt
 
.INPUTS
 
    Text file
 
.OUTPUTS
 
    None
 
.LINK
 
    https://github.com/angryhussord/
#>

[CmdletBinding()]
param
(
    [Parameter(Mandatory=$true,
               Position=0,
               HelpMessage="File name that contains a simple list of the chocolatey packages you want to have installed.")]
    [ValidateScript({Test-Path $_})]
    [string] $PackageList
)

$packages = Get-Content $PackageList

foreach ($package in $packages) {
    $cmd = "choco install " + $package + " -y";
    Invoke-Expression $cmd;
}