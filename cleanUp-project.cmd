@ECHO OFF

GOTO //////////////////////////////////////////////////

Removes (deletes) a directory.

RMDIR [/S] [/Q] [drive:]path
RD [/S] [/Q] [drive:]path

    /S      Removes all directories and files in the specified directory
            in addition to the directory itself.  Used to remove a directory
            tree.

    /Q      Quiet mode, do not ask if ok to remove a directory tree with /S


::::  Eclipse directory (keep)
rd /s /q %1\.settings

://////////////////////////////////////////////////

if ""%1""=="""" GOTO noPARAM

rd /s /q %1\bin
rd /s /q %1\build

GOTO END

:noPARAM

ECHO "usage: %0 <folder>"

:END

