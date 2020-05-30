@ECHO OFF

REM ----------- SETENV -----------

GOTO //////////////////////////////////////////////////

::  ECHO %~f0  -- complete path & filename of running script
::  ECHO %~dp0 -- complete path of running script

%HOME% - may be defined by Windows domain setting (your network drive)


://////////////////////////////////////////////////

::  SET HOME=%USERPROFILE%

::         https://hmsholdings@dev.azure.com/hmsholdings/eCare/_git/eCare_API
::         https://hmsholdings@dev.azure.com/hmsholdings/eCare/_git/eCare_UI
SET repo-vsts=https://c171437:clludnrlhhuxft4wbtbg7ozdwrexlllzvovuk42f6lxkydnff3ra@dev.azure.com/hmsholdings/eCare/_git/eCare_


::         https://github.com/hmsholdings/cav-ecare-api.git
::         https://github.com/hmsholdings/cav-ecare-ui.git
SET repo-gh=https://james-hms:cf0e4a90c04a757e1e7af91b4b2808be8fbbaf17@github.com/hmsholdings/cav-ecare-


SET GITDIR=W:\Git
SET PATH=%GITDIR%\cmd;%PATH%

