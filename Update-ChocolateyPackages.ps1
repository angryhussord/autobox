<#
.SYNOPSIS
    Upgrades all of the installed chocolatey packages on a machine.
 
    Author: Patrick Hufford (angryhussord@outlook.com)
 
.DESCRIPTION
    Upgrades all of the chocolatey packages on the computer without confimring the installation of each package.
 
.PARAMETER None
 
 
.EXAMPLE
 
    .\Update-ChocolateyPackages.ps1
 
.INPUTS None
 
.OUTPUTS None
 
.LINK
 
    https://github.com/angryhussord/
    https://github.com/chocolatey/choco
#>

choco upgrade all -y