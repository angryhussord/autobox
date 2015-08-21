if ( (get-command choco -ErrorAction:SilentlyContinue).count -eq 0 ) {
	Invoke-Expression ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'));
} else {
	Write-Output "Chocolatey is already installed, checking for upgrades...";
    choco upgrade chocolatey -y;
}
Write-Output "Exiting...";