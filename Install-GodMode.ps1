if (!(Test-Path -Path "$ENV:PUBLIC\Desktop\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}")) {
    Write-Output "Installing GodMode shortcut to Public User profile..."
    New-Item -Path "$ENV:PUBLIC\Desktop\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}" -ItemType "Directory" | Out-Null
    Write-Output "GodMode installed complete!"
} else {
    Write-Output "GodMode has already been installed on this computer. Exiting..."
}