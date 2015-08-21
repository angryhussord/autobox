#Re-image Post-Install Script
#Written By: angryhussord
#Purpose: After re-installing Windows, this will install chocolatey, install packages, then install
#	custom packages that Chocolatey cannot/does not support.


Write-Output "Moving User Shell Folders to D:\"
.\Move-UserShellFolders.ps1

Write-Output "Installing Chocolatey."
.\Install-Chocolatey.ps1
Write-Output "Installation complete."

Write-Output "Installing GodMode shortcut."
.\Install-GodMode.ps1
Write-Output "Installation complete."

Write-Output "Installing Telnet Client."
.\Install-TelnetClient.ps1
Write-Output "Installation complete."

Write-Output "Installing workstation packages via Chocolatey."
.\Install-WorkstationPackages.ps1 Workstation-Packages.txt
Write-Output "Installation complete."

#Install Office 2013 SP1 w/Updates
Write-Output "Installing Office 2013 SP1."
cd .\office2013\
.\Install-Office2013.ps1
cd ..
Write-Output "Installation complete."

Write-Output "Workstation configuration complete."

Write-Output "Installing Windows Updates..."
Import-Module PSWindowsUpdate
Add-WUServiceManager -ServiceID 7971f918-a847-4430-9279-4a52d1efe18d -Confirm:$false | Out-Null
Get-WUList -MicrosoftUpdate | Out-Null
Get-WUInstall –MicrosoftUpdate –AcceptAll –AutoReboot
Restart-Computer