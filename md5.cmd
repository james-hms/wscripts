@ECHO OFF

GOTO //////////////////////////////////////////////////

certutil -hashfile jd-cli-0.9.2-dist.zip MD5

://////////////////////////////////////////////////

::  List the classes in a jar file

if ""%1""=="""" GOTO noPARAM

certutil -hashfile %1 MD5


GOTO END

:noPARAM

ECHO "usage: %0 <file>"

:END

