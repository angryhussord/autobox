#Download ISO image
#VS 2015 Pro
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
Mount-DiskImage -ImagePath $path;
$drive = (Get-Volume | ?{$_.FileSystemLabel -eq "VS2015_PRO_ENU"}).DriveLetter;
$adminxml = (Get-Location).Path + "\VisualStudio2015\AdminDeployment.xml";
$cmd = $drive + ":\vs_professional.exe /adminfile $adminxml /quiet /norestart";
Invoke-Expression $cmd;
while (Get-Process devenv.exe) {
	Sleep -Second 60;
}
Dismount-DiskImage -ImagePath $path;