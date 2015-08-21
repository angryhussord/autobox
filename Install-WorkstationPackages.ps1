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