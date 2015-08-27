<#
.SYNOPSIS
    If it's not already installed, installs the chocolatey package manager for Windows.
    Author: Patrick Hufford (angryhussord@outlook.com)

.DESCRIPTION

.PARAMETER None

.EXAMPLE
    .\Install-Chocolatey.ps1

.INPUTS

.OUTPUTS

.LINK
 
    https://github.com/angryhussord/
#>

if ( (get-command choco -ErrorAction:SilentlyContinue).count -eq 0 ) {
	Invoke-Expression ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'));
} else {
	Write-Output "Chocolatey is already installed, checking for upgrades...";
	choco upgrade chocolatey -y;
}
Write-Output "Exiting...";