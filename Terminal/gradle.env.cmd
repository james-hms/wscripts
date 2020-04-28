@ECHO OFF

REM ----------- SETENV -----------

GOTO //////////////////////////////////////////////////

::  ECHO %~f0  -- complete path & filename of running script
::  ECHO %~dp0 -- complete path of running script

W:\>gradle -h

USAGE: gradle [option...] [task...]

-?, -h, --help          Shows this help message.
-a, --no-rebuild        Do not rebuild project dependencies.
-b, --build-file        Specify the build file.
--build-cache           Enables the Gradle build cache. Gradle will try to reuse outputs from previous builds. [incubating]
-c, --settings-file     Specify the settings file.
--configure-on-demand   Configure necessary projects only. Gradle will attempt to reduce configuration time for large multi-project builds. [incubating]
--console               Specifies which type of console output to generate. Values are 'plain', 'auto' (default) or 'rich'.
--continue              Continue task execution after a task failure.
-D, --system-prop       Set system property of the JVM (e.g. -Dmyprop=myvalue).
-d, --debug             Log in debug mode (includes normal stacktrace).
--daemon                Uses the Gradle Daemon to run the build. Starts the Daemon if not running.
--foreground            Starts the Gradle Daemon in the foreground. [incubating]
-g, --gradle-user-home  Specifies the gradle user home directory.
-I, --init-script       Specify an initialization script.
-i, --info              Set log level to info.
--include-build         Include the specified build in the composite. [incubating]
-m, --dry-run           Run the builds with all task actions disabled.
--max-workers           Configure the number of concurrent workers Gradle is allowed to use. [incubating]
--no-build-cache        Disables the Gradle build cache. [incubating]
--no-daemon             Do not use the Gradle Daemon to run the build.
--no-scan               Disables the creation of a build scan. (https://gradle.com/build-scans) [incubating]
--offline               Execute the build without accessing network resources.
-P, --project-prop      Set project property for the build script (e.g. -Pmyprop=myvalue).
-p, --project-dir       Specifies the start directory for Gradle. Defaults to current directory.
--parallel              Build projects in parallel. Gradle will attempt to determine the optimal number of executor threads to use. [incubating]
--profile               Profile build execution time and generates a report in the <build_dir>/reports/profile directory.
--project-cache-dir     Specify the project-specific cache directory. Defaults to .gradle in the root project directory.
-q, --quiet             Log errors only.
--recompile-scripts     Force build script recompiling.
--refresh-dependencies  Refresh the state of dependencies.
--rerun-tasks           Ignore previously cached task results.
-S, --full-stacktrace   Print out the full (very verbose) stacktrace for all exceptions.
-s, --stacktrace        Print out the stacktrace for all exceptions.
--scan                  Creates a build scan. Gradle will emit a warning if the build scan plugin has not been applied. (https://gradle.com/build-scans) [incubating]
--status                Shows status of running and recently stopped Gradle Daemon(s).
--stop                  Stops the Gradle Daemon if it is running.
-t, --continuous        Enables continuous build. Gradle does not exit and will re-execute tasks when task file inputs change. [incubating]
-u, --no-search-upward  Don't search in parent folders for a settings.gradle file.
-v, --version           Print version info.
-w, --warn              Set log level to warn.
-x, --exclude-task      Specify a task to be excluded from execution.

::::::::::::::::::::

gradle -v

------------------------------------------------------------
Gradle 4.1
------------------------------------------------------------

Build time:   2017-08-07 14:38:48 UTC
Revision:     941559e020f6c357ebb08d5c67acdb858a3defc2

Groovy:       2.4.11
Ant:          Apache Ant(TM) version 1.9.6 compiled on June 29 2015
JVM:          1.8.0_221 (Oracle Corporation 25.221-b11)
OS:           Windows 10 10.0 amd64


::  gradlew clean build war
::  gradle --info       war
::  gradle --debug      war
::  gradle --stacktrace war

://////////////////////////////////////////////////

SET GRADLE_HOME=W:\Gradle

SET PATH=%GRADLE_HOME%\bin;%PATH%
