. .\Download-File.ps1
[System.Uri]$url = "http://download.microsoft.com/download/1/D/8/1D8B5022-5477-4B9A-8104-6A71FF9D98AB/WindowsTH-KB2693643-x64.msu"
$path = (Get-Location).Path + "\";
$filename = $url.AbsolutePath.Split("/")[$url.AbsolutePath.Split("/").count-1];
Download-File $url $path;
$path = $path + $filename;
Start-Process -FilePath $path -Wait -ArgumentList "/quiet /norestart"
Write-Output "Installation complete. Please reboot your computer for changes to take effect."

#Cleaning up after ourselves...
Remove-Item $path;