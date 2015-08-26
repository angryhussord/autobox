[System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true};

#Install PaowerShellUtils
$url = "https://bitbucket.org/guillermooo/powershellutils/downloads/PowershellUtils.sublime-package";
$path = "$env:AppData" + "\Sublime Text 3\Installed Packages\PowershellUtils.sublime-package";
$client = new-object System.Net.WebClient;
$client.Headers.Add("Accept-Language", "en-us,en;q=0.5");
$client.Headers.Add("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.4) Gecko/20060508 Firefox/1.5.0.4");
$file = $client.DownloadString($url);
$file | Set-Content $path;

#Install PowerShell
$url = "https://bitbucket.org/guillermooo/powershell/downloads/PowerShell.sublime-package";
$path = "$env:AppData" + "\Sublime Text 3\Installed Packages\PowerShell.sublime-package";
$client = new-object System.Net.WebClient;
$client.Headers.Add("Accept-Language", "en-us,en;q=0.5");
$client.Headers.Add("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.4) Gecko/20060508 Firefox/1.5.0.4");
$file = $client.DownloadString($url);
$file | Set-Content $path;

#Install PowerShell
$url = "https://bitbucket.org/guillermooo/aaapackagedev/downloads/AAAPackageDev.sublime-package";
$path = "$env:AppData" + "\Sublime Text 3\Installed Packages\AAAPackageDev.sublime-package";
$client = new-object System.Net.WebClient;
$client.Headers.Add("Accept-Language", "en-us,en;q=0.5");
$client.Headers.Add("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.4) Gecko/20060508 Firefox/1.5.0.4");
$file = $client.DownloadString($url);
$file | Set-Content $path;

$url = "https://packagecontrol.io/Package%20Control.sublime-package";
$path = "$env:AppData" + "\Sublime Text 3\Installed Packages\Package Control.sublime-package";
$client = new-object System.Net.WebClient;
$client.Headers.Add("Accept-Language", "en-us,en;q=0.5");
$client.Headers.Add("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.4) Gecko/20060508 Firefox/1.5.0.4");
$file = $client.DownloadString($url);
$file | Set-Content $path;