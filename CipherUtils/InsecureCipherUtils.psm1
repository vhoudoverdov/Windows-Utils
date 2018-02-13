<# 
 .Synopsis 
     Disable insecure RC4 ciphers on Windows.  Disables RC4 128/128, RC4 56/128, and RC4 40/128  
     Vasken Houdoverdov
 .Example
     Disable-Rc4Ciphers
 #>  
 
 Function Disable-Rc4Ciphers
 {
 
    $Path = 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\'
 
    New-Item -Path "$Path$('RC4 128')$([char]0x2215)128" -Force
    New-ItemProperty -Path "$Path$('RC4 128')$([char]0x2215)128" -PropertyType DWORD -Value '0' -Name 'Enabled'
 
    New-Item -Path "$Path$('RC4 56')$([char]0x2215)128" -Force
    New-ItemProperty -Path "$Path$('RC4 56')$([char]0x2215)128" -PropertyType DWORD -Value '0' -Name 'Enabled'
 
    New-Item -Path "$Path$('RC4 40')$([char]0x2215)128" -Force
    New-ItemProperty -Path "$Path$('RC4 40')$([char]0x2215)128" -PropertyType DWORD -Value '0' -Name 'Enabled'
}

<# 
 .Synopsis 
     Disable insecure versions of TLS on Windows.  Disables TLS 1.0 and TLS 1.1  
     Vasken Houdoverdov
 .Example
     Disable-Tls -DisableVersion1_0
 .Example
     Disable-Tls -DisableVersion1_1
 .Example
     Disable-Tls -DisableVersion1_0 -DisableVersion1_1    
 #> 
Function Disable-Tls 
{
Param([Switch]$DisableVersion1_0,
      [Switch]$DisableVersion1_1)
   
    $Path = 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\'

    if($DisableVersion1_0){
    New-Item "$Path$('TLS 1.0\Server')" -Force
    New-ItemProperty -Path "$Path$('TLS 1.0\Server')" -Name 'Enabled' -Value '0' -PropertyType DWORD -Force
    New-ItemProperty -Path "$Path$('TLS 1.0\Server')" -Name 'DisabledByDefault' -Value 1 -PropertyType DWORD -Force

    New-Item "$Path$('TLS 1.0\Client')" -Force
    New-ItemProperty -Path "$Path$('TLS 1.0\Client')" -Name 'Enabled' -Value '0' -PropertyType DWORD -Force
    New-ItemProperty -Path "$Path$('TLS 1.0\Client')" -Name 'DisabledByDefault' -Value 1 -PropertyType DWORD -Force}

   if($DisableVersion1_1){
    New-Item "$Path$('TLS 1.1\Server')" -Force
    New-ItemProperty -Path "$Path$('TLS 1.1\Server')" -Name 'Enabled' -Value '0' -PropertyType DWORD -Force
    New-ItemProperty -Path "$Path$('TLS 1.1\Server')" -Name 'DisabledByDefault' -Value 1 -PropertyType DWORD -Force
   
    New-Item "$Path$('TLS 1.1\Client')" -Force
    New-ItemProperty -Path "$Path$('TLS 1.1\Client')" -Name 'Enabled' -Value '0' -PropertyType DWORD -Force
    New-ItemProperty -Path "$Path$('TLS 1.1\Client')" -Name 'DisabledByDefault' -Value 1 -PropertyType DWORD -Force}
}

<# 
 .Synopsis 
     Enable insecure RC4 ciphers on Windows.  Enables RC4 128/128, RC4 56/128, and RC4 40/128  
     Vasken Houdoverdov
 .Example
     Enable-Rc4Ciphers
 #>  
 
 Function Enable-Rc4Ciphers
 {
 
    $Path = 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\'
 
    New-Item -Path "$Path$('RC4 128')$([char]0x2215)128" -Force
    New-ItemProperty -Path "$Path$('RC4 128')$([char]0x2215)128" -PropertyType DWORD -Value '1' -Name 'Enabled'
 
    New-Item -Path "$Path$('RC4 56')$([char]0x2215)128" -Force
    New-ItemProperty -Path "$Path$('RC4 56')$([char]0x2215)128" -PropertyType DWORD -Value '1' -Name 'Enabled'
 
    New-Item -Path "$Path$('RC4 40')$([char]0x2215)128" -Force
    New-ItemProperty -Path "$Path$('RC4 40')$([char]0x2215)128" -PropertyType DWORD -Value '1' -Name 'Enabled'
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
Param([Switch]$EnableVersion1_0,
      [Switch]$EnableVersion1_1)
   
    $Path = 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\'

    if($EnableVersion1_0){
    New-Item "$Path$('TLS 1.0\Server')" -Force
    New-ItemProperty -Path "$Path$('TLS 1.0\Server')" -Name 'Enabled' -Value '1' -PropertyType DWORD -Force
    New-ItemProperty -Path "$Path$('TLS 1.0\Server')"-PropertyType DWORD -Value 0  -Name 'DisabledByDefault' 

    New-Item "$Path$('TLS 1.0\Client')" -Force
    New-ItemProperty -Path "$Path$('TLS 1.0\Client')" -Name 'Enabled' -Value '1' -PropertyType DWORD -Force
    New-ItemProperty -Path "$Path$('TLS 1.0\Client')"-PropertyType DWORD -Value 0  -Name 'DisabledByDefault' }

   if($EnableVersion1_1){
    New-Item "$Path$('TLS 1.1\Server')" -Force
    New-ItemProperty -Path "$Path$('TLS 1.1\Server')" -Name 'Enabled' -Value '1' -PropertyType DWORD -Force
    New-ItemProperty -Path "$Path$('TLS 1.1\Server')"-PropertyType DWORD -Value 0  -Name 'DisabledByDefault' 
   
    New-Item "$Path$('TLS 1.1\Client')" -Force
    New-ItemProperty -Path "$Path$('TLS 1.1\Client')" -Name 'Enabled' -Value '1' -PropertyType DWORD -Force
    New-ItemProperty -Path "$Path$('TLS 1.1\Client')"-PropertyType DWORD -Value 0  -Name 'DisabledByDefault' }
}

Export-ModuleMember *