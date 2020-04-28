@ECHO OFF

REM ----------- SETENV -----------

GOTO //////////////////////////////////////////////////

::  ECHO %~f0  -- complete path & filename of running script
::  ECHO %~dp0 -- complete path of running script



://////////////////////////////////////////////////

SET myPython=W:\Python\python-3.7.1.amd64\Scripts;W:\Python\python-3.7.1.amd64\Lib\site-packages;W:\Python\python-3.7.1.amd64

SET PATH=%myPython%;%PATH%

