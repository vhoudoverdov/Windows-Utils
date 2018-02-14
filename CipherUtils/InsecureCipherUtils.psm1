<# 
 .Synopsis 
     Disable insecure RC4 ciphers on Windows.  Disables RC4 128/128, RC4 64/128, RC4 56/128, and RC4 40/128  
     Vasken Houdoverdov
 .Example
     Disable-Rc4Ciphers
 #>  
 
 Function Disable-Rc4Ciphers
 {
 
    $Path = 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\'
 
    New-Item -Path "$Path$('RC4 128')$([char]0x2215)128" -Force
    New-ItemProperty -Path "$Path$('RC4 128')$([char]0x2215)128" -PropertyType DWORD -Value '0' -Name 'Enabled'
 
    New-Item -Path "$Path$('RC4 64')$([char]0x2215)128" -Force
    New-ItemProperty -Path "$Path$('RC4 64')$([char]0x2215)128" -PropertyType DWORD -Value '0' -Name 'Enabled'

    New-Item -Path "$Path$('RC4 56')$([char]0x2215)128" -Force
    New-ItemProperty -Path "$Path$('RC4 56')$([char]0x2215)128" -PropertyType DWORD -Value '0' -Name 'Enabled'
 
    New-Item -Path "$Path$('RC4 40')$([char]0x2215)128" -Force
    New-ItemProperty -Path "$Path$('RC4 40')$([char]0x2215)128" -PropertyType DWORD -Value '0' -Name 'Enabled'
}

<# 
 .Synopsis 
     Disable insecure RC2 ciphers on Windows.  Disables RC2 128/128, RC2 56/128, and RC2 40/128  
     Vasken Houdoverdov
 .Example
     Disable-Rc2Ciphers
 #>  
 
 Function Disable-Rc2Ciphers
 {
 
    $Path = 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\'
 
    New-Item -Path "$Path$('RC2 128')$([char]0x2215)128" -Force
    New-ItemProperty -Path "$Path$('RC2 128')$([char]0x2215)128" -PropertyType DWORD -Value '0' -Name 'Enabled'

    New-Item -Path "$Path$('RC2 56')$([char]0x2215)128" -Force
    New-ItemProperty -Path "$Path$('RC2 56')$([char]0x2215)128" -PropertyType DWORD -Value '0' -Name 'Enabled'
 
    New-Item -Path "$Path$('RC2 40')$([char]0x2215)128" -Force
    New-ItemProperty -Path "$Path$('RC2 40')$([char]0x2215)128" -PropertyType DWORD -Value '0' -Name 'Enabled'
}

<# 
 .Synopsis 
     Disable insecure DES ciphers on Windows.  Disables DES 56/56  
     Vasken Houdoverdov
 .Example
     Disable-DesCiphers
 #>  
 
 Function Disable-DesCiphers
 {
    $Path = 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\'
 
    New-Item -Path "$Path$('DES 56')$([char]0x2215)56" -Force
    New-ItemProperty -Path "$Path$('DES 56')$([char]0x2215)56" -PropertyType DWORD -Value '0' -Name 'Enabled'
}

<# 
 .Synopsis 
     Disable insecure versions of TLS on Windows.  Disables TLS 1.0 and TLS 1.1  
     Vasken Houdoverdov
 .Example
     Disable-Tls -DisableVersion 1.0
 .Example
     Disable-Tls -DisableVersion 1.1
 .Example
     Disable-Tls -DisableVersion Both 
 #> 
Function Disable-Tls 
{
Param([Parameter(Mandatory=$true)]
      [ValidateSet('1.0','1.1','Both')]
      [String]$DisableVersion)
 
    $Path = 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\'

    if($DisableVersion -eq '1.0' -or $DisableVersion -eq 'Both'){
    New-Item "$Path$('TLS 1.0\Server')" -Force
    New-ItemProperty -Path "$Path$('TLS 1.0\Server')" -Name 'Enabled' -Value '0' -PropertyType DWORD -Force
    New-ItemProperty -Path "$Path$('TLS 1.0\Server')" -Name 'DisabledByDefault' -Value 1 -PropertyType DWORD -Force

    New-Item "$Path$('TLS 1.0\Client')" -Force
    New-ItemProperty -Path "$Path$('TLS 1.0\Client')" -Name 'Enabled' -Value '0' -PropertyType DWORD -Force
    New-ItemProperty -Path "$Path$('TLS 1.0\Client')" -Name 'DisabledByDefault' -Value 1 -PropertyType DWORD -Force}

    if($DisableVersion -eq '1.1' -or $DisableVersion -eq 'Both'){
    New-Item "$Path$('TLS 1.1\Server')" -Force
    New-ItemProperty -Path "$Path$('TLS 1.1\Server')" -Name 'Enabled' -Value '0' -PropertyType DWORD -Force
    New-ItemProperty -Path "$Path$('TLS 1.1\Server')" -Name 'DisabledByDefault' -Value 1 -PropertyType DWORD -Force
   
    New-Item "$Path$('TLS 1.1\Client')" -Force
    New-ItemProperty -Path "$Path$('TLS 1.1\Client')" -Name 'Enabled' -Value '0' -PropertyType DWORD -Force
    New-ItemProperty -Path "$Path$('TLS 1.1\Client')" -Name 'DisabledByDefault' -Value 1 -PropertyType DWORD -Force}
}

<# 
 .Synopsis 
     Disable insecure versions of SSL on Windows.  Disables SSL 2.0 and SSL 3.0
     Vasken Houdoverdov
 .Example
     Disable-Ssl -DisableVersion 2.0
 .Example
     Disable-Ssl -DisableVersion 3.0
 .Example
     Disable-Ssl -DisableVersion Both
 #> 
Function Disable-Ssl 
{
Param([Parameter(Mandatory=$true)]
      [ValidateSet('2.0','3.0','Both')]
      [String]$DisableVersion)
 
    $Path = 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\'

    if($DisableVersion -eq '2.0' -or $DisableVersion -eq 'Both'){
    New-Item "$Path$('SSL 2.0\Server')" -Force
    New-ItemProperty -Path "$Path$('SSL 2.0\Server')" -Name 'Enabled' -Value '0' -PropertyType DWORD -Force
    New-ItemProperty -Path "$Path$('SSL 2.0\Server')" -Name 'DisabledByDefault' -Value 1 -PropertyType DWORD -Force

    New-Item "$Path$('TLS 1.0\Client')" -Force
    New-ItemProperty -Path "$Path$('SSL 2.0\Client')" -Name 'Enabled' -Value '0' -PropertyType DWORD -Force
    New-ItemProperty -Path "$Path$('SSL 2.0\Client')" -Name 'DisabledByDefault' -Value 1 -PropertyType DWORD -Force}

    if($DisableVersion -eq '3.0' -or $DisableVersion -eq 'Both'){
    New-Item "$Path$('TLS 1.1\Server')" -Force
    New-ItemProperty -Path "$Path$('SSL 3.0\Server')" -Name 'Enabled' -Value '0' -PropertyType DWORD -Force
    New-ItemProperty -Path "$Path$('SSL 3.0\Server')" -Name 'DisabledByDefault' -Value 1 -PropertyType DWORD -Force
   
    New-Item "$Path$('TLS 1.1\Client')" -Force
    New-ItemProperty -Path "$Path$('SSL 3.0\Client')" -Name 'Enabled' -Value '0' -PropertyType DWORD -Force
    New-ItemProperty -Path "$Path$('SSL 3.0\Client')" -Name 'DisabledByDefault' -Value 1 -PropertyType DWORD -Force}
}

<# 
 .Synopsis 
     Enable insecure RC4 ciphers on Windows.  Enables RC4 128/128, RC4 64/128, RC4 56/128, and RC4 40/128  
     Vasken Houdoverdov
 .Example
     Enable-Rc4Ciphers
 #>  
 
 Function Enable-Rc4Ciphers
 {
 
    $Path = 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\'
 
    New-Item -Path "$Path$('RC4 128')$([char]0x2215)128" -Force
    New-ItemProperty -Path "$Path$('RC4 128')$([char]0x2215)128" -PropertyType DWORD -Value '1' -Name 'Enabled'
 
    New-Item -Path "$Path$('RC4 64')$([char]0x2215)128" -Force
    New-ItemProperty -Path "$Path$('RC4 64')$([char]0x2215)128" -PropertyType DWORD -Value '1' -Name 'Enabled'
 
    New-Item -Path "$Path$('RC4 56')$([char]0x2215)128" -Force
    New-ItemProperty -Path "$Path$('RC4 56')$([char]0x2215)128" -PropertyType DWORD -Value '1' -Name 'Enabled'
 
    New-Item -Path "$Path$('RC4 40')$([char]0x2215)128" -Force
    New-ItemProperty -Path "$Path$('RC4 40')$([char]0x2215)128" -PropertyType DWORD -Value '1' -Name 'Enabled'
}

<# 
 .Synopsis 
     Enable insecure RC2 ciphers on Windows.  Enables RC2 128/128, RC2 56/128, and RC2 40/128  
     Vasken Houdoverdov
 .Example
     Enable-Rc2Ciphers
 #>  
 
 Function Enable-Rc2Ciphers
 {
 
    $Path = 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\'
 
    New-Item -Path "$Path$('RC2 128')$([char]0x2215)128" -Force
    New-ItemProperty -Path "$Path$('RC2 128')$([char]0x2215)128" -PropertyType DWORD -Value '1' -Name 'Enabled'
 
    New-Item -Path "$Path$('RC2 56')$([char]0x2215)128" -Force
    New-ItemProperty -Path "$Path$('RC2 56')$([char]0x2215)128" -PropertyType DWORD -Value '1' -Name 'Enabled'
 
    New-Item -Path "$Path$('RC2 40')$([char]0x2215)128" -Force
    New-ItemProperty -Path "$Path$('RC2 40')$([char]0x2215)128" -PropertyType DWORD -Value '1' -Name 'Enabled'
}

<# 
 .Synopsis 
     Enable insecure DES ciphers on Windows.  Enables DES 56/56
     Vasken Houdoverdov
 .Example
     Enable-DesCiphers
 #>  
 
 Function Enable-DesCiphers
 {
    $Path = 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\'
 
    New-Item -Path "$Path$('DES 56')$([char]0x2215)56" -Force
    New-ItemProperty -Path "$Path$('RC2 56')$([char]0x2215)56" -PropertyType DWORD -Value '1' -Name 'Enabled'
}

<# 
 .Synopsis 
     Enable older versions of TLS on Windows.  Enables TLS 1.0 and TLS 1.1  
     Vasken Houdoverdov
 .Example
     Enable-Tls -EnableVersion1_0
 .Example
     Enable-Tls -EnableVersion1_1
 .Example
     Enable-Tls -EnableVersion1_0 -EnableVersion1_1    
 #> 
Function Enable-Tls 
{
Param([Parameter(Mandatory=$true)]
      [ValidateSet('1.0','1.1','Both')]
      [String]$EnableVersion)
 
    $Path = 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\'

    if($EnableVersion -eq '1.0' -or $EnableVersion -eq 'Both'){
    New-Item "$Path$('TLS 1.0\Server')" -Force
    New-ItemProperty -Path "$Path$('TLS 1.0\Server')" -Name 'Enabled' -Value '1' -PropertyType DWORD -Force
    New-ItemProperty -Path "$Path$('TLS 1.0\Server')"-PropertyType DWORD -Value 0  -Name 'DisabledByDefault' 

    New-Item "$Path$('TLS 1.0\Client')" -Force
    New-ItemProperty -Path "$Path$('TLS 1.0\Client')" -Name 'Enabled' -Value '1' -PropertyType DWORD -Force
    New-ItemProperty -Path "$Path$('TLS 1.0\Client')"-PropertyType DWORD -Value 0  -Name 'DisabledByDefault' }

    if($EnableVersion -eq '1.1' -or $EnableVersion -eq 'Both'){
    New-Item "$Path$('TLS 1.1\Server')" -Force
    New-ItemProperty -Path "$Path$('TLS 1.1\Server')" -Name 'Enabled' -Value '1' -PropertyType DWORD -Force
    New-ItemProperty -Path "$Path$('TLS 1.1\Server')"-PropertyType DWORD -Value 0  -Name 'DisabledByDefault' 
   
    New-Item "$Path$('TLS 1.1\Client')" -Force
    New-ItemProperty -Path "$Path$('TLS 1.1\Client')" -Name 'Enabled' -Value '1' -PropertyType DWORD -Force
    New-ItemProperty -Path "$Path$('TLS 1.1\Client')"-PropertyType DWORD -Value 0  -Name 'DisabledByDefault' }
}

<# 
 .Synopsis 
     Enable older versions of SSL on Windows.  Enables SSL 2.0 and SSL 3.0  
     Vasken Houdoverdov
 .Example
     Enable-Ssl -EnableVersion 2.0
 .Example
     Enable-Ssl -EnableVersion 3.0
 .Example
     Enable-Ssl -EnableVersion Both
 #> 
Function Enable-Ssl 
{
Param([Parameter(Mandatory=$true)]
      [ValidateSet('2.0','3.0','Both')]
      [String]$EnableVersion)
 
    $Path = 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\'

    if($EnableVersion -eq '2.0' -or $EnableVersion -eq 'Both'){
    New-Item "$Path$('SSL 2.0\Server')" -Force
    New-ItemProperty -Path "$Path$('SSL 2.0\Server')" -Name 'Enabled' -Value '1' -PropertyType DWORD -Force
    New-ItemProperty -Path "$Path$('SSL 2.0\Server')"-PropertyType DWORD -Value 0  -Name 'DisabledByDefault' 

    New-Item "$Path$('SSL 2.0\Server')" -Force
    New-ItemProperty -Path "$Path$('SSL 2.0\Client')" -Name 'Enabled' -Value '1' -PropertyType DWORD -Force
    New-ItemProperty -Path "$Path$('SSL 2.0\Client')"-PropertyType DWORD -Value 0  -Name 'DisabledByDefault' }

    if($EnableVersion -eq '3.0' -or $EnableVersion -eq 'Both'){
    New-Item "$Path$('TLS 1.1\Server')" -Force
    New-ItemProperty -Path "$Path$('SSL 3.0\Server')" -Name 'Enabled' -Value '1' -PropertyType DWORD -Force
    New-ItemProperty -Path "$Path$('SSL 3.0\Server')"-PropertyType DWORD -Value 0  -Name 'DisabledByDefault' 
   
    New-Item "$Path$('TLS 1.1\Client')" -Force
    New-ItemProperty -Path "$Path$('SSL 3.0\Client')" -Name 'Enabled' -Value '1' -PropertyType DWORD -Force
    New-ItemProperty -Path "$Path$('SSL 3.0\Client')"-PropertyType DWORD -Value 0  -Name 'DisabledByDefault' }
}

Export-ModuleMember *