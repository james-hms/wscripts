@ECHO OFF

GOTO //////////////////////////////////////////////////

You can use the jd-cli.bat (Windows) or jd-cli (Linux/Unix) scripts to run the the JAR file.

Usage: java -jar jd-cli.jar [options] [Files to decompile]
Options:
--displayLineNumbers, -n
   displays line numbers in decompiled classes
   Default: false
--escapeUnicodeCharacters, -eu
   escape unicode characters in decompiled classes
   Default: false
--help, -h
   shows this help
   Default: false
--logLevel, -g
   takes [level] as parameter and sets it as the CLI log level. Possible
   values are: ALL, TRACE, DEBUG, INFO, WARN, ERROR, OFF
   Default: INFO
--outputConsole, -oc
   enables output to system output stream
   Default: false
--outputDir, -od
   takes a [directoryPath] as a parameter and configures DIR output for this
   path
--outputZipFile, -oz
   takes a [zipFilePath] as a parameter and configures ZIP output for this
   path
--skipResources, -sr
   skips processing resources
   Default: false

::::::::::::::::::::

java -jar w:\wscripts\jar\jd-cli.jar -oc Detab.class

java -jar jd-cli.jar -od <my-output-folder> <my-input-folder>


://////////////////////////////////////////////////

::  https://github.com/kwart/jd-cmd


if ""%1""=="""" GOTO noPARAM

java -jar %JAVA_HOME%\jd-cli.jar -oc %1 > %TEMP%\%1.class2java.java

START %USERPROFILE%\HDD\Notepad2\Notepad2.exe %TEMP%\%1.class2java.java

GOTO END

:noPARAM

ECHO.
ECHO "usage: %0 <class>"
ECHO.

:END
