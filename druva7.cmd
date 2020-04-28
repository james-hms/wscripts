@ECHO OFF


GOTO //////////////////////////////////////////////////

7z a -t7Z %USERPROFILE%\Desktop\archive.7z W:\ZZ


://////////////////////////////////////////////////

::  Clear the hidden and read-only attributes of files
 FOR /F "tokens=*" %%G IN ('DIR /B /S D:\Thumbs.db')    DO ATTRIB -H -R "%%G"
 FOR /F "tokens=*" %%G IN ('DIR /B /S D:\extenxls.lic') DO ATTRIB -H -R "%%G"
 FOR /F "tokens=*" %%G IN ('DIR /B /S D:\*harvest.sig') DO ATTRIB -H -R "%%G"



::  Delete all "junk" files in directory & subdirectories
 FOR /F "tokens=*" %%G IN ('DIR /B /S D:\Thumbs.db')    DO DEL /Q "%%G"
 FOR /F "tokens=*" %%G IN ('DIR /B /S D:\extenxls.lic') DO DEL /Q "%%G"
 FOR /F "tokens=*" %%G IN ('DIR /B /S D:\*harvest.sig') DO DEL /Q "%%G"
 FOR /F "tokens=*" %%G IN ('DIR /B /S D:\*.class')      DO DEL /Q "%%G"




::::
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set bkup_date=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME: =0%")  do (set bkup_time=%%a%%b)

7z a -t7Z %USERPROFILE%\Favorites\Druva_D_drive\archive.%bkup_date%_%bkup_time%.7z D:


set bkup_date=
set bkup_time=

