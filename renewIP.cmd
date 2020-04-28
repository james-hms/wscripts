@ECHO OFF


GOTO //////////////////////////////////////////////////

:: Works only for dynamic IP, not static.

ipconfig /release
pause
ipconfig /renew
pause
ipconfig /flushdns
pause
ipconfig /registerdns
pause
netsh dump
pause
nbtstat -R
pause
netsh int ip reset reset.log
pause
netsh winsock reset
pause

://////////////////////////////////////////////////

ipconfig /release
pause
ipconfig /flushdns
pause
ipconfig /renew

