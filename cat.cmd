@ECHO OFF


GOTO //////////////////////////////////////////////////

Displays the contents of a text file or files.

TYPE [drive:][path]filename

:::

%0 - script name
%1 - 1st command line parameter
%2 - 2nd command line parameter  (and so on till %9)
%* - ALL command line parameters (excluding the script name itself)


://////////////////////////////////////////////////

:: concatenate 2 or more files --> cat.txt

if ""%2""=="""" GOTO PARAM-1

if exist cat.txt del cat.txt

for %%x in (%*) do (
   type %%~x >> cat.txt
)

GOTO END

:PARAM-1
:: just print the single file to standard output

if ""%1""=="""" GOTO noPARAM

type %1

GOTO END

:noPARAM

ECHO "usage: %0 <file1> [<file2>...]"

:END

