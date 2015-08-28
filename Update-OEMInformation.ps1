$regpath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation";

if (Get-ItemProperty -Path $regpath -Name "Manufacturer") {
    Set-ItemProperty -Path $regpath -Name "Manufacturer" -Value "Patrick Hufford";
} else {
    New-ItemProperty -Path $regpath -Name "Manufacturer" -PropertyType String -Value "Patrick Hufford";
}

if (Get-ItemProperty -Path $regpath -Name "Model") {
    Set-ItemProperty -Path $regpath -Name "Model" -Value "May 2012 | i5-3570k | 32GB DDR3 1600 | Nvidia GTX 670";
} else {
    New-ItemProperty -Path $regpath -Name "Model" -PropertyType String -Value "Late 2012 | i5-3570k | 32GB DDR3 1600 | Nvidia GTX 670";    
}

if (Get-ItemProperty -Path $regpath -Name "SupportHours") {
    Set-ItemProperty -Path $regpath -Name "SupportHours" -Value "Thurs - Sat 7AM - 7PM PST";
} else {
    New-ItemProperty -Path $regpath -Name "SupportHours" -PropertyType String -Value "Thurs - Sat 7AM - 7PM PST";
}

if (Get-ItemProperty -Path $regpath -Name "SupportPhone") {
    Set-ItemProperty -Path $regpath -Name "SupportPhone" -Value "425-293-3450";
} else {
    New-ItemProperty -Path $regpath -Name "SupportPhone" -PropertyType String -Value "425-293-3450";
}

if (Get-ItemProperty -Path $regpath -Name "SupportURL") {
    Set-ItemProperty -Path $regpath -Name "SupportURL" -Value "http://www.hufford.org/";
} else {
    New-ItemProperty -Path $regpath -Name "SupportURL" -PropertyType String -Value "http://www.hufford.org/";
}
#New-ItemProperty -Path $regpath -Name "Logo" -PropertyType String -Value "c:\Logo\Logo.bmp";