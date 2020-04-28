@ECHO OFF


GOTO //////////////////////////////////////////////////


FOR /F "tokens=*" %%G IN ('DIR /B /S *.class') DO DEL "%%G"


://////////////////////////////////////////////////

if ""%1""=="""" GOTO noPARAM

::  Clear the hidden and read-only attributes of files
FOR /F "tokens=*" %%G IN ('DIR /B /S %1\Thumbs.db')    DO ATTRIB -H -R "%%G"
FOR /F "tokens=*" %%G IN ('DIR /B /S %1\extenxls.lic') DO ATTRIB -H -R "%%G"

::  Delete all "junk" files in directory & subdirectories
 FOR /F "tokens=*" %%G IN ('DIR /B /S %1\Thumbs.db') DO DEL /Q "%%G"
 FOR /F "tokens=*" %%G IN ('DIR /B /S %1\extenxls.lic') DO DEL /Q "%%G"



::  Delete all  (.harvest.sig , harvest.sig)  files in directory & subdirectories

FOR /F "tokens=*" %%G IN ('DIR /B /S %1\*harvest.sig') DO ATTRIB -H -R "%%G"

pause

@ECHO ON
FOR /F "tokens=*" %%G IN ('DIR /B /S %1\*harvest.sig') DO DEL /Q "%%G"
@ECHO OFF

GOTO END

:noPARAM

ECHO "usage: %0 <top-level directory>"

:END

