@ECHO OFF


GOTO //////////////////////////////////////////////////


7z x -tgzip -so theinputfile.tgz | 7z x -si -ttar

-tgzip is needed if the input file is named .tgz instead of .tar.gz


W:\>tgunzip w:\directory\someFile.tgz .\extractDirectory
W:\>tgunzip  .\directory\someFile.tgz .\extractDirectory

7-Zip 18.01 (x64) : Copyright (c) 1999-2018 Igor Pavlov : 2018-01-28


Extracting archive:
--
Path =
Type = tar
Code Page = UTF-8

Everything is Ok

Folders: 516
Files: 1492
Size:       8099069910
Compressed: 1037824


://////////////////////////////////////////////////

if ""%2""=="""" GOTO noPARAM

::  Extract the *.tgz file into the specified directory

7z x -tgzip -so %1 | 7z x -si -ttar -o%2

GOTO END

:noPARAM

ECHO "usage: %0 <filename> <directory>"

:END

