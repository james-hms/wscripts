@ECHO OFF

GOTO //////////////////////////////////////////////////

@echo off

For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)

(12 hr time)  For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a%%b)

or

(24 hr time)  For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)

echo %mydate%_%mytime%

set mydate=
set mytime=

://////////////////////////////////////////////////

::  Make backup copy of file with date timestamp in name of file

if ""%1""=="""" GOTO noPARAM

::  ( there is a space between : and = ). That will replace the space with a 0
::  echo %TIME: =0%


For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set bkup_date=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME: =0%")  do (set bkup_time=%%a%%b)

copy /V /Y %1 %1.%bkup_date%_%bkup_time%

set bkup_date=
set bkup_time=


GOTO END

:noPARAM

ECHO "usage: %0 <file>"

:END

