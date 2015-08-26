#Download the driver .zip file
$url = "http://12244.wpc.azureedge.net/8012244/drivers/rtdrivers/pc/audio/0006-Win7_Win8_Win81_Win10_R279.zip"
$path = (Get-Location).Path + "\0006-Win7_Win8_Win81_Win10_R279.zip";
$client = new-object System.Net.WebClient;
$client.DownloadFile( $url, $path );

#
$7zip_path = (Get-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | ? {$_.DisplayName -eq "7-Zip*"}).InstallLocation;

#Extract files to a folder locally
$cmd = "C:\Progra~1\7-Zip\7z.exe x $path";
Invoke-Expression $cmd;

#Run setup.exe with the setup.iss file for silent operation
$cmd = (Get-Location).Path + "\Win7_Win8_Win81_Win10_R279\Setup.exe /s /v/qn /f1`"" + $((Get-Location).Path + "\Win7_Win8_Win81_Win10_R279\setup.iss") + "`"" + " /f2`"c:\temp\realtekhdaudio_R279.log`"";
Invoke-Expression $cmd;