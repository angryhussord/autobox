. ..\Download-File.ps1

$path = "$env:AppData" + "\Sublime Text 3\Installed Packages\";

#Install Sublime Packages
$url = "https://packagecontrol.io/Package%20Control.sublime-package";
Download-File $url $path;

$url = "https://bitbucket.org/guillermooo/powershellutils/downloads/PowershellUtils.sublime-package";
Download-File $url $path;

$url = "https://bitbucket.org/guillermooo/powershell/downloads/PowerShell.sublime-package";
Download-File $url $path;

$url = "https://bitbucket.org/guillermooo/aaapackagedev/downloads/AAAPackageDev.sublime-package";
Download-File $url $path;

