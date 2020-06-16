@ECHO OFF


GOTO //////////////////////////////////////////////////


FOR /F "tokens=*" %%G IN ('DIR /B /S *.class') DO DEL "%%G"


://////////////////////////////////////////////////

::  Delete all *.log files in directory & subdirectories

FOR /F "tokens=*" %%G IN ('DIR /B /S C:\Apps\WebLogic\*.log') DO DEL /Q "%%G"

