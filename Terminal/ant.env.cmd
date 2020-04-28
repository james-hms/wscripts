@ECHO OFF

REM ----------- SETENV -----------

GOTO //////////////////////////////////////////////////

::  ECHO %~f0  -- complete path & filename of running script
::  ECHO %~dp0 -- complete path of running script

W:\>ant -h

ant [options] [target [target2 [target3] ...]]
Options:
  -help, -h              print this message and exit
  -projecthelp, -p       print project help information and exit
  -version               print the version information and exit
  -diagnostics           print information that might be helpful to
                         diagnose or report problems and exit
  -quiet, -q             be extra quiet
  -silent, -S            print nothing but task outputs and build failures
  -verbose, -v           be extra verbose
  -debug, -d             print debugging information
  -emacs, -e             produce logging information without adornments
  -lib <path>            specifies a path to search for jars and classes
  -logfile <file>        use given file for log
    -l     <file>                ''
  -logger <classname>    the class which is to perform logging
  -listener <classname>  add an instance of class as a project listener
  -noinput               do not allow interactive input
  -buildfile <file>      use given buildfile
    -file    <file>              ''
    -f       <file>              ''
  -D<property>=<value>   use value for given property
  -keep-going, -k        execute all targets that do not depend
                         on failed target(s)
  -propertyfile <name>   load all properties from file with -D
                         properties taking precedence
  -inputhandler <class>  the class which will handle input requests
  -find <file>           (s)earch for buildfile towards the root of
    -s  <file>           the filesystem and use it
  -nice  number          A niceness value for the main thread:
                         1 (lowest) to 10 (highest); 5 is the default
  -nouserlib             Run ant without using the jar files from
                         ${user.home}/.ant/lib
  -noclasspath           Run ant without using CLASSPATH
  -autoproxy             Java1.5+: use the OS proxy settings
  -main <class>          override Ant's normal entry point

::::::::::::::::::::

ant -version
Apache Ant(TM) version 1.10.6 compiled on May 2 2019

://////////////////////////////////////////////////

SET ANT_HOME=W:\Ant

SET PATH=%ANT_HOME%\bin;%PATH%
