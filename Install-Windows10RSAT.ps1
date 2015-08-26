. .\Download-File.ps1
$url = "http://download.microsoft.com/download/1/D/8/1D8B5022-5477-4B9A-8104-6A71FF9D98AB/WindowsTH-KB2693643-x64.msu"
$path = (Get-Location).Path;

Write-Output "Downloading Windows 10 RSAT...";
Download-File $url $path;
Write-Output "Download complete, installing Windows 10 RSAT...";
$path = $path + '\WindowsTH-KB2693643-x64.msu';
Start-Process -FilePath $Path -Wait -ArgumentList "/quiet /norestart"
Write-Output "Installation complete. Please reboot your computer for changes to take effect."

#Cleaning up after ourselves...
Remove-Item $path;