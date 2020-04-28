@ECHO OFF

GOTO //////////////////////////////////////////////////

Creating a blank file from a batch file

://////////////////////////////////////////////////

::  same as 'touch' command in Linux

if ""%1""=="""" GOTO noPARAM

cd . > %1

GOTO END

:noPARAM

ECHO "usage: %0 <file>"

:END

