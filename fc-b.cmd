@ECHO OFF

GOTO //////////////////////////////////////////////////

certutil -hashfile jd-cli-0.9.2-dist.zip MD5

://////////////////////////////////////////////////

::  List the classes in a jar file

if ""%2""=="""" GOTO noPARAM

fc /b %1 %2

GOTO END

:noPARAM

ECHO "usage: %0 <file1> <file2>"

:END

