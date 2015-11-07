<#
.SYNOPSIS
    Installs Visual Studio 2015 Professional
    Author: Patrick Hufford (angryhussord@outlook.com)

.DESCRIPTION
    Downloads the publicly available VS 2015 Pro ISO from MSDN, mounts the image, installs silently using the AdminDeployment.xml.
    Dismounts the image and removes it. The download is large, on the order of 4GB, so be patient. If you already have a local copy
    if the ISO you can drop it in the same folder as this script and it'll use that instead of downloading it.
.PARAMETER None

.EXAMPLE
    .\Install-VisualStudio.ps1

.INPUTS

.OUTPUTS

.LINK
 
    https://github.com/angryhussord/
#>
. ..\Download-File.ps1

$url = "http://download.microsoft.com/download/5/8/9/589A8843-BA4D-4E63-BCB2-B2380E5556FD/vs2015.pro_enu.iso";
$path = (Get-Location).Path;
if ((Get-Item vs2015.pro_enu.iso -ErrorAction:SilentlyContinue).count -eq 0) {
	Write-Output "Downloading Visual Studio 2015 Professional ISO. This can take quite some time, please be patient...";
	Download-File $url $path;
} else {
	Write-Output "Using local copy of the ISO...";
}

#Installs Visual Studio 2015 from the ISO image
Mount-DiskImage -ImagePath ($ath + "\vs2015.pro_enu.iso");
$drive = (Get-Volume | ?{$_.FileSystemLabel -eq "VS2015_PRO_ENU"}).DriveLetter;
$adminxml = (Get-Location).Path + "\AdminDeployment.xml";
$cmd = $drive + ":\vs_professional.exe /adminfile $adminxml /quiet /norestart";
Invoke-Expression $cmd;
while (Get-Process devenv.exe) {
	Sleep -Second 60;
}
Dismount-DiskImage -ImagePath $path;