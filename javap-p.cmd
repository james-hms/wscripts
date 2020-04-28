@ECHO OFF

GOTO //////////////////////////////////////////////////

Usage: javap <options> <classes>
where possible options include:
  -help  --help  -?        Print this usage message
  -version                 Version information
  -v  -verbose             Print additional information
  -l                       Print line number and local variable tables
  -public                  Show only public classes and members
  -protected               Show protected/public classes and members
  -package                 Show package/protected/public classes
                           and members (default)
  -p  -private             Show all classes and members
  -c                       Disassemble the code
  -s                       Print internal type signatures
  -sysinfo                 Show system info (path, size, date, MD5 hash)
                           of class being processed
  -constants               Show final constants
  -classpath <path>        Specify where to find user class files
  -cp <path>               Specify where to find user class files
  -bootclasspath <path>    Override location of bootstrap class files

:::::::::::

SET JAVA_HOME=C:\java\jdk8
SET CLASSPATH=.;W:\wscripts\jar\*;W:\wscripts\class

SET PATH=%JAVA_HOME%\bin;%PATH%

://////////////////////////////////////////////////

::  javap <options> <class>


if ""%1""=="""" GOTO noPARAM

JAVAP -p %1 > %TEMP%\%1.javap.java

START %USERPROFILE%\HDD\Notepad2\Notepad2.exe %TEMP%\%1.javap.java

GOTO END

:noPARAM

ECHO.
ECHO "usage: %0 <class>"
ECHO.

:END
