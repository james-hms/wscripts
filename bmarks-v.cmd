@ECHO OFF

GOTO //////////////////////////////////////////////////

::  Grab a copy of the current Google Chrome bookmarks

::copy /v /y "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Bookmarks" %USERPROFILE%\Desktop\Bookmarks-c.%bkup_date%_%bkup_time%.json


://////////////////////////////////////////////////

::  ( there is a space between : and = ). That will replace the space with a 0
::  echo %TIME: =0%

For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set bkup_date=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME: =0%")  do (set bkup_time=%%a%%b)


set temporary_file=%USERPROFILE%\Favorites\Bookmarks\Bookmarks-vivaldi.%bkup_date%_%bkup_time%.json


echo // Vivaldi Bookmarks file (ascii text), has no file extension> %temporary_file%
echo //>> %temporary_file%
echo.>> %temporary_file%

type "%USERPROFILE%\AppData\Local\Vivaldi\User Data\Default\Bookmarks" >> %temporary_file%

set bkup_date=
set bkup_time=
set temporary_file=
