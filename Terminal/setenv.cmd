@ECHO OFF

REM ----------- SETENV -----------

GOTO //////////////////////////////////////////////////

::  ECHO %~f0  -- complete path & filename of running script
::  ECHO %~dp0 -- complete path of running script

::  SET ANT_HOME=W:\Ant
::  SET JBOSS_HOME=W:\JBoss
::  SET CATALINA_HOME=W:\Tomcat
::  SET DERBY_HOME=W:\derby

:: SET PATH=%PATH%;%ANT_HOME%\bin
:: SET PATH=%PATH%;%DERBY_HOME%\bin

://////////////////////////////////////////////////

SET DIRCMD=/a /ogen

SET DB_PASSWD=Ecenter01
SET DB_USER=db2dev2
:: SET USER_CD=00044982

SET PATH=%PATH%;W:\wscripts


::  Call any other .cmd file
CALL %~dp0git.env.cmd
CALL %~dp0ant.env.cmd
CALL %~dp0maven.env.cmd
CALL %~dp0gradle.env.cmd
CALL %~dp0nodejs.env.cmd
CALL %~dp0java.env.cmd
::   CALL %~dp0python.env.cmd


::  START /B /D%HOMEDRIVE%\
START /B /DW:\
TITLE CMD
IF "%USERDNSDOMAIN%"=="" (ECHO %COMPUTERNAME%) ELSE (ECHO %COMPUTERNAME%.%USERDNSDOMAIN%)
