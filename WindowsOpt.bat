@echo off
REM Cleanup of temporary files, DNS flush, IP renewal, and other checks

REM Cleanup of Windows Temp folder
del /s /f /q %windir%\temp\*.*
rd /s /q %windir%\temp
md %windir%\temp

REM Cleanup of Prefetch folder
del /s /f /q %windir%\Prefetch\*.*
rd /s /q %windir%\Prefetch
md %windir%\Prefetch

REM Cleanup of dllcache folder
del /s /f /q %windir%\system32\dllcache\*.*
rd /s /q %windir%\system32\dllcache
md %windir%\system32\dllcache

REM Cleanup of user's Temp folder
del /s /f /q "%USERPROFILE%\Temp"\*.*
rd /s /q "%USERPROFILE%\Temp"
md "%USERPROFILE%\Temp"

REM Cleanup of History folder
del /s /f /q "%USERPROFILE%\Local Settings\History"\*.*
rd /s /q "%USERPROFILE%\Local Settings\History"
md "%USERPROFILE%\Local Settings\History"

REM Cleanup of Temporary Internet Files folder
del /s /f /q "%USERPROFILE%\Local Settings\Temporary Internet Files"\*.*
rd /s /q "%USERPROFILE%\Local Settings\Temporary Internet Files"
md "%USERPROFILE%\Local Settings\Temporary Internet Files"

REM Cleanup of user's Temp folder
del /s /f /q "%USERPROFILE%\Local Settings\Temp"\*.*
rd /s /q "%USERPROFILE%\Local Settings\Temp"
md "%USERPROFILE%\Local Settings\Temp"

REM Cleanup of Recent folder
del /s /f /q "%USERPROFILE%\Recent"\*.*
rd /s /q "%USERPROFILE%\Recent"
md "%USERPROFILE%\Recent"

REM Cleanup of Cookies folder
del /s /f /q "%USERPROFILE%\Cookies"\*.*
rd /s /q "%USERPROFILE%\Cookies"
md "%USERPROFILE%\Cookies"

REM DNS Flush
ipconfig /flushdns

REM IP Renewal
ipconfig /renew

REM IP Release
ipconfig /release

REM Disk Check
chkdsk /f

REM System File Check
sfc /scannow

REM Display Active Connections
netstat

REM Disk Cleanup
cleanmgr

REM Reactivate Network Adapters
netsh interface set interface "Wi-Fi" admin=enable
netsh interface set interface "Ethernet 2" admin=disable
netsh interface set interface "Ethernet 2" admin=enable
netsh interface set interface "Ethernet" admin=disable
netsh interface set interface "Ethernet" admin=enable

REM Cleanup Completed!
cls

REM Open folders to check results
Explorer %userprofile%\Recent
Explorer C:\Windows\Prefetch
Explorer C:\Windows\Temp
Explorer %USERPROFILE%\appdata\local\temp
