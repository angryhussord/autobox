<#
.SYNOPSIS
    Installs the given Windows feature.
    Author: Patrick Hufford (angryhussord@outlook.com)
 
.DESCRIPTION
    Installs the named Windows feature using DISM. A list of features available can be retrieved with Get-WindowsFeature.ps1
.PARAMETER FeatureName
    The name of the Feature you wish to install.
.EXAMPLE
    .\Install-WindowsFeature.ps1 TelnetClient
 
.INPUTS
    String
.OUTPUTS
    None
.LINK
    https://github.com/angryhussord/
#>

param (
	[string]$FeatureName
)
$exist = .\Get-WindowsFeatures.ps1 | ? {$_.Name -eq $FeatureName};
if ($exist) {
	dism /online /Enable-Feature /FeatureName:$FeatureName | Out-Null;
} else {
	Write-Error "Could not find that feature on this system.";
}