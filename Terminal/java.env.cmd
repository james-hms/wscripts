@ECHO OFF

REM ----------- SETENV -----------

GOTO //////////////////////////////////////////////////

::  ECHO %~f0  -- complete path & filename of running script
::  ECHO %~dp0 -- complete path of running script



://////////////////////////////////////////////////

SET JAVA_HOME=C:\java\jdk8
SET CLASSPATH=.;W:\wscripts\jar\*;W:\wscripts\class

SET PATH=%JAVA_HOME%\bin;%PATH%

