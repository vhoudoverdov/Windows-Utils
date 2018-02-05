<# 
 .Synopsis 
     Disable insecure RC4 ciphers on Windows.  Disables RC4 128/128, RC4 56/128, and RC4 40/128  
     Vasken Houdoverdov
 .Example
     Disable-Rc4Ciphers
 #>  
 
 Function Disable-Rc4Ciphers {
 
 $Root = 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\'
 
 New-Item -Path "$Root$('RC4 128')$([char]0x2215)128" -Force
 New-ItemProperty -Path "$Root$('RC4 128')$([char]0x2215)128" -PropertyType DWORD -Value '0' -Name 'Enabled'
 
 New-Item -Path "$Root$('RC4 56')$([char]0x2215)128" -Force
 New-ItemProperty -Path "$Root$('RC4 56')$([char]0x2215)128" -PropertyType DWORD -Value '0' -Name 'Enabled'
 
 New-Item -Path "$Root$('RC4 40')$([char]0x2215)128" -Force
 New-ItemProperty -Path "$Root$('RC4 40')$([char]0x2215)128" -PropertyType DWORD -Value '0' -Name 'Enabled'
 }