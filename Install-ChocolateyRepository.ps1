<#
.SYNOPSIS
    Installs the Chocolatey repository so that Windows 10 OneGet can use it to install packages. Also changes the PSGallery repository to Trusted.
    Author: Patrick Hufford (angryhussord@outlook.com)

.DESCRIPTION

.PARAMETER None

.EXAMPLE
    .\Install-ChocoalteyRepository.ps1

.EXAMPLE

.INPUTS

.OUTPUTS

.LINK
 
    https://github.com/angryhussord/
#>

Register-PackageSource -Name Chocolatey -Location https://chocolatey.org/api/v2/ -Provider PSModule -Trusted
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted