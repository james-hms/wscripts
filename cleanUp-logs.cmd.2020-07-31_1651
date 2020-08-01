@ECHO OFF


GOTO //////////////////////////////////////////////////


FOR /F "tokens=*" %%G IN ('DIR /B /S *.class') DO DEL "%%G"


://////////////////////////////////////////////////

if ""%1""=="""" GOTO noPARAM

::  Delete all *.log files in directory & subdirectories

FOR /F "tokens=*" %%G IN ('DIR /B /S %1\*.log') DO DEL /Q "%%G"

GOTO END

:noPARAM

ECHO "usage: %0 <top-level directory>"

:END

