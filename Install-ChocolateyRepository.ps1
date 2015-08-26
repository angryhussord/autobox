Register-PackageSource -Name Chocolatey -Location https://chocolatey.org/api/v2/ -ProviderName Chocolatey -Trusted
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted