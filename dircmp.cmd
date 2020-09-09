@ECHO OFF


GOTO //////////////////////////////////////////////////

Command line usage
If you start Meld from the command line, you can tell it what to do when it starts.

For a two- or three-way file comparison,
 start Meld with meld file1 file2 or meld file1 file2 file3 respectively.

For a two- or three-way directory comparison,
 start Meld with meld dir1 dir2 or meld dir1 dir2 dir3.

You can start a version control comparison by just giving a single argument;
 if that file or directory is managed by a recognized version control system,
 it will start a version control comparison on that argument.
 For example, meld . would start a version control view of the current directory.

Run meld --help for a list of all command line options.

://////////////////////////////////////////////////

if ""%2""=="""" GOTO noPARAM

::  Compare 2 directories with Meld
start C:\PROGRA~2\Meld\Meld.exe %1 %2

GOTO END

:noPARAM

ECHO "usage: %0 <directory1> <directory2>"

:END

