function Valid-UrlFormat { 
    param(
        [System.Uri]$url
    )
    return ($url.AbsoluteURI -ne $null -and $url.Scheme -match '[http|https]');
} 

function Download-File {

    # Usage: Download-File -url 'https://chocolateypackages.s3.amazonaws.com/borderlessgaming.8.2.nupkg' -path 'D:\SkyDrive\Scripts' -IgnoreSSLCertErrors

    param(
        [System.Uri]$url,
        [string]$path,
        [switch]$IgnoreSSLCertErrors
        )

    #Validate the URL, if it's not a proper URL, throw an Error
    if (-not (Valid-UrlFormat($url))) {
        Write-Error "$url is not a valid URL.";
        return;
    }

    $numSegments = ([System.Uri]$url).Segments.Length;
    $filename = ([System.Uri]$url).Segments[$numSegments-1];

    #Validate the path, if it doesn't exist, create it.
    if (Test-Path $path) {
        if (-not ($path.EndsWith('\'))) {
            $path = $path + '\' + $filename;
        } else {
            $path = $path + $filename;
        }
    } else {
        Write-Warning "$path did not exist, so we created it for you."
        mkdir $path;
        if (-not ($path.EndsWith('\'))) {
            $path = $path + '\' + $filename;
        } else {
            $path = $path + $filename;
        }
    }

    #Try to download the data at the given URL
    $client = new-object System.Net.WebClient;
    if ($url.Scheme -eq 'https') {
        if ($IgnoreSSLCertErrors) {
            [System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true};
        }
        $client.Headers.Add("Accept-Language", "en-us,en;q=0.5");
        $client.Headers.Add("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.4) Gecko/20060508 Firefox/1.5.0.4");
    }

    $client.DownloadFile( $url, $path );
}