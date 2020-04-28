@ECHO OFF

GOTO //////////////////////////////////////////////////


Running the Formatter Application
---------------------------------

Running the Formatter Application is as simple as running the
 org.eclipse.jdt.core.JavaCodeFormatter application from the commandline:

  eclipse -vm <path to virtual machine> -application org.eclipse.jdt.core.JavaCodeFormatter [ OPTIONS ] <files>



<files>
 Java source files and/or directories to format. Only files ending with .java will
 be formatted in the given directory.

[ OPTIONS ]

-config <file>
 Use the formatting style from the specified properties file.

-help
 Display the help message.

-quiet
 Only print error messages.

-verbose
 Be verbose about the formatting job.



Generating a config file for the Formatter Application
-------------------------------------------------------

Generating a config file for the Formatter Application involves modifying
the code formatter settings for a Java Project and copying
"org.eclipse.jdt.core.prefs" out of the .settings directory for that project.


 1. Select a java project, open the pop-up menu and choose Properties.
 2. Select the Code Style > Formatter page and check Enable project specific sttings.
 3. Select or edit a profile as explained above.
 4. Click OK when you are done.
 5. Use either a file manager or the command line to copy
    workspace/YourJavaProject/.settings/org.eclipse.jdt.core.prefs to a new location.


://////////////////////////////////////////////////

::  ECHO %~f0  - complete path & filename of running script
::  ECHO %~dp0 - complete path of running script


SET JAVA_HOME="C:\Program Files\Java\jdk1.6.0_21"

SET ECLIPSE_HOME=C:\jbdevstudio\eclipse

SET STYLE=%~dp0org.eclipse.jdt.core.prefs

::  Command script to Run the Formatter Application

%ECLIPSE_HOME%\eclipse -vm %JAVA_HOME%\bin\java.exe -application org.eclipse.jdt.core.JavaCodeFormatter -verbose -config %STYLE% %1

