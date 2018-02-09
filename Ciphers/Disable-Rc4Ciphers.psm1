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
    New-ItemProperty -path "$Path$('RC4 128')$([char]0x2215)128" -PropertyType DWORD -Value '0' -Name 'Enabled'
 
    New-Item -Path "$Path$('RC4 56')$([char]0x2215)128" -Force
    New-ItemProperty -path "$Path$('RC4 56')$([char]0x2215)128" -PropertyType DWORD -Value '0' -Name 'Enabled'
 
    New-Item -Path "$Path$('RC4 40')$([char]0x2215)128" -Force
    New-ItemProperty -path "$Path$('RC4 40')$([char]0x2215)128" -PropertyType DWORD -Value '0' -Name 'Enabled'
}


Function Disable-Tls 
{
Param([Switch]$DisableVersion1_0,
      [Switch]$DisableVersion1_1)
   
    $Path = 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\'

    if($DisableVersion1_0){
    New-Item "$Path$('TLS 1.0\Server')" -Force | Out-Null
    New-ItemProperty -path "$Path$('TLS 1.0\Server')" -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null
    New-ItemProperty -path "$Path$('TLS 1.0\Server')" -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null

    New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client' -Force | Out-Null
    New-ItemProperty -path "$Path$('TLS 1.0\Client')" -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null
    New-ItemProperty -path "$Path$('TLS 1.0\Client')" -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null}

   if($DisableVersion1_1){
    New-Item "$Path$('TLS 1.1\Server')" -Force | Out-Null
    New-ItemProperty -path "$Path$('TLS 1.1\Server')" -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null
    New-ItemProperty -path "$Path$('TLS 1.1\Server')" -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null
   
    New-Item "$Path$('TLS 1.1\Client')" -Force | Out-Null
    New-ItemProperty -path "$Path$('TLS 1.1\Client')" -name 'Enabled' -value '0' -PropertyType 'DWord' -Force | Out-Null
    New-ItemProperty -path "$Path$('TLS 1.1\Client')" -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null}
}
Export-ModuleMember *