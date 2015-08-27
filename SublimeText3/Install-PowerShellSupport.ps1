<#
.SYNOPSIS
    Installs PowerShell support for Sublime Text 3
    Author: Patrick Hufford (angryhussord@outlook.com)

.DESCRIPTION
    Installs 4 packages that help support code highlighting and other PowerShell tools.

.PARAMETER None

.EXAMPLE
    .\Install-PowerShellSupport.ps1

.INPUTS

.OUTPUTS

.LINK
 
    https://github.com/angryhussord/
#>

. ..\Download-File.ps1

$path = "$env:AppData" + "\Sublime Text 3\Installed Packages\";

#Install Sublime Packages
$url = "https://packagecontrol.io/Package%20Control.sublime-package";
Download-File $url $path;

$url = "https://bitbucket.org/guillermooo/powershellutils/downloads/PowershellUtils.sublime-package";
Download-File $url $path;

$url = "https://bitbucket.org/guillermooo/powershell/downloads/PowerShell.sublime-package";
Download-File $url $path;

$url = "https://bitbucket.org/guillermooo/aaapackagedev/downloads/AAAPackageDev.sublime-package";
Download-File $url $path;

