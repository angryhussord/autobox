#Download Installer for Windows 10
$url = "http://download.bitdefender.com/windows/desktop/t_security/2015w10/en-us/bitdefender_ts_19_64b.exe"
$path = (Get-Location).Path + "\bitdefender_ts_19_64b.exe"; 
$client = new-object System.Net.WebClient;
Write-Output "Downloading BitDefender. This can take quite some time, please be patient...";
$client.DownloadFile( $url, $path );

$cmd = $path + " /s";
Invoke-Expression $cmd;