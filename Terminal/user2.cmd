@ECHO OFF

REM ----------- USER2 -----------
SET ZORRO=%USERPROFILE%\User2

GOTO //////////////////////////////////////////////////

::  ECHO %~f0  -- complete path & filename of running script
::  ECHO %~dp0 -- complete path of running script

::  code.cmd
VSC=W:\VSCode\bin

::  codium.cmd
VSC=C:\Apps\VSCodium\bin

://////////////////////////////////////////////////

SET APPDATA=%ZORRO%\AppData\Roaming

SET HOME=%ZORRO%
SET HOMEDRIVE=C:
SET HOMEPATH=\

SET LOCALAPPDATA=%ZORRO%\AppData\Local

SET TEMP=%ZORRO%\AppData\Local\Temp
SET  TMP=%ZORRO%\AppData\Local\Temp


SET USERNAME=User2
SET USERPROFILE=%ZORRO%


::  Call setenv.cmd file
CALL %~dp0setenv.cmd

TITLE User2
