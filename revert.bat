REM take ownership away from TrustedInstaller and give it to yourself
takeown /f "C:\windows\system32\WindowsPowerShell\v1.0\powershell_ise.exe" /a
takeown /f "C:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.PowerShell.GPowerShell\v4.0_3.0.0.0__31bf3856ad364e35\Microsoft.PowerShell.GPowerShell.dll" /a

REM give Administrators full control
cacls "C:\windows\system32\WindowsPowerShell\v1.0\powershell_ise.exe" /e /p administrators:f
cacls "C:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.PowerShell.GPowerShell\v4.0_3.0.0.0__31bf3856ad364e35\Microsoft.PowerShell.GPowerShell.dll" /e /p administrators:f

REM backup the existing ones... just in case
ren "C:\windows\system32\WindowsPowerShell\v1.0\powershell_ise.exe" powershell_ise.exe.bak
ren "C:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.PowerShell.GPowerShell\v4.0_3.0.0.0__31bf3856ad364e35\Microsoft.PowerShell.GPowerShell.dll" Microsoft.PowerShell.GPowerShell.dll.bak

REM copy the older (better) ones into place
copy /y powershell_ise.exe "C:\windows\system32\WindowsPowerShell\v1.0\"
copy /y Microsoft.PowerShell.GPowerShell.dll "C:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.PowerShell.GPowerShell\v4.0_3.0.0.0__31bf3856ad364e35"
