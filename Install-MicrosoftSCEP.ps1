<#
.SYNOPSIS
    Install System Center Endpoint Protection for Windows clients. 
    Author: Patrick Hufford (angryhussord@outlook.com)
 
.DESCRIPTION
    Silently installs and then immediately updates the SCEP client for Windows.
    You'll need to have a copy of the installer program from MSDN or some other source in the same directory as this script.
 
.EXAMPLE
    .\Install-MicrosoftSCEP.ps1    
 
.INPUTS
    SCEPInstall.exe

.OUTPUTS
    None
    
 .LINK
 
    https://github.com/angryhussord/
#>

#Install System Center Endpoint Protection
.\SCEPInstall.exe /S

#Need to wait for .NET Optimization service, check to make sure it's running.
#Check if MsMpEng.exe is running
$count = 0;
while ((Get-Process -Name MsMpEng -ErrorAction:SilentlyContinue) -eq $null -and $count -lt 50) {
    Sleep -Seconds 10
    $count++;
}
if ($count -eq 50) {
    Write-Output "Couldn't verify that System Center Endpoint Protection is running. Please reboot the computer and perform a manual update of the definitions.";
    return;
} else {
    Write-Output "System Center Endpoint Protection is now running."
}

#Now, let's update the definitions for SCEP...
Import-Module "$env:ProgramFiles\Microsoft Security Client\MpProvider";
Update-MProtSignature -UpdateSource MicrosoftUpdateServer;
Start-MProtScan -ScanType QuickScan
Write-Output "System Center Endpoint Protection has been installed and updated.";