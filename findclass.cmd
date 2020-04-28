@ECHO OFF

GOTO //////////////////////////////////////////////////

FORFILES [/P pathname] [/M searchmask] [/S]
         [/C command] [/D [+ | -] {MM/dd/yyyy | dd}]

Description:
    Selects a file (or set of files) and executes a 
    command on that file. This is helpful for batch jobs.

Parameter List:
    /P    pathname      Indicates the path to start searching.
                        The default folder is the current working
                        directory (.).

    /M    searchmask    Searches files according to a searchmask.
                        The default searchmask is '*' .

    /S                  Instructs forfiles to recurse into
                        subdirectories. Like "DIR /S".

    /C    command       Indicates the command to execute for each file.
                        Command strings should be wrapped in double
                        quotes. 

                        The default command is "cmd /c echo @file".

                        The following variables can be used in the
                        command string:
                        @file    - returns the name of the file.
                        @fname   - returns the file name without
                                   extension.
                        @ext     - returns only the extension of the
                                   file.
                        @path    - returns the full path of the file.
                        @relpath - returns the relative path of the
                                   file.
                        @isdir   - returns "TRUE" if a file type is
                                   a directory, and "FALSE" for files.
                        @fsize   - returns the size of the file in
                                   bytes.
                        @fdate   - returns the last modified date of the
                                   file.
                        @ftime   - returns the last modified time of the
                                   file.

                        To include special characters in the command 
                        line, use the hexadecimal code for the character
                        in 0xHH format (ex. 0x09 for tab). Internal
                        CMD.exe commands should be preceded with
                        "cmd /c".

    /D    date          Selects files with a last modified date greater
                        than or equal to (+), or less than or equal to
                        (-), the specified date using the
                        "MM/dd/yyyy" format; or selects files with a
                        last modified date greater than or equal to (+)
                        the current date plus "dd" days, or less than or
                        equal to (-) the current date minus "dd" days. A
                        valid "dd" number of days can be any number in
                        the range of 0 - 32768.
                        "+" is taken as default sign if not specified.

    /?                  Displays this help message.

Examples:
    FORFILES /?
    FORFILES  
    FORFILES /P C:\WINDOWS /S /M DNS*.* 
    FORFILES /S /M *.txt /C "cmd /c type @file | more"
    FORFILES /P C:\ /S /M *.bat
    FORFILES /D -30 /M *.exe
             /C "cmd /c echo @path 0x09 was changed 30 days ago"
    FORFILES /D 01/01/2001
             /C "cmd /c echo @fname is new since Jan 1st 2001"
    FORFILES /D +6/9/2014 /C "cmd /c echo @fname is new today"
    FORFILES /M *.exe /D +1
    FORFILES /S /M *.doc /C "cmd /c echo @fsize" 
    FORFILES /M *.txt /C "cmd /c if @isdir==FALSE notepad.exe @file"

::::::::::::::::::::

Starts a new instance of the Windows command interpreter

CMD [/A | /U] [/Q] [/D] [/E:ON | /E:OFF] [/F:ON | /F:OFF] [/V:ON | /V:OFF]
    [[/S] [/C | /K] string]

/C      Carries out the command specified by string and then terminates
/K      Carries out the command specified by string but remains
/S      Modifies the treatment of string after /C or /K (see below)
/Q      Turns echo off
/D      Disable execution of AutoRun commands from registry (see below)
/A      Causes the output of internal commands to a pipe or file to be ANSI
/U      Causes the output of internal commands to a pipe or file to be
        Unicode
/T:fg   Sets the foreground/background colors (see COLOR /? for more info)
/E:ON   Enable command extensions (see below)
/E:OFF  Disable command extensions (see below)
/F:ON   Enable file and directory name completion characters (see below)
/F:OFF  Disable file and directory name completion characters (see below)
/V:ON   Enable delayed environment variable expansion using ! as the
        delimiter. For example, /V:ON would allow !var! to expand the
        variable var at execution time.  The var syntax expands variables
        at input time, which is quite a different thing when inside of a FOR
        loop.
/V:OFF  Disable delayed environment expansion.

Note that multiple commands separated by the command separator '&&'
are accepted for string if surrounded by quotes.  Also, for compatibility
reasons, /X is the same as /E:ON, /Y is the same as /E:OFF and /R is the
same as /C.  Any other switches are ignored.

If /C or /K is specified, then the remainder of the command line after
the switch is processed as a command line, where the following logic is
used to process quote (") characters:

    1.  If all of the following conditions are met, then quote characters
        on the command line are preserved:

        - no /S switch
        - exactly two quote characters
        - no special characters between the two quote characters,
          where special is one of: &<>()@^|
        - there are one or more whitespace characters between the
          two quote characters
        - the string between the two quote characters is the name
          of an executable file.

    2.  Otherwise, old behavior is to see if the first character is
        a quote character and if so, strip the leading character and
        remove the last quote character on the command line, preserving
        any text after the last quote character.

If /D was NOT specified on the command line, then when CMD.EXE starts, it
looks for the following REG_SZ/REG_EXPAND_SZ registry variables, and if
either or both are present, they are executed first.

    HKEY_LOCAL_MACHINE\Software\Microsoft\Command Processor\AutoRun

        and/or

    HKEY_CURRENT_USER\Software\Microsoft\Command Processor\AutoRun

Command Extensions are enabled by default.  You may also disable
extensions for a particular invocation by using the /E:OFF switch.  You
can enable or disable extensions for all invocations of CMD.EXE on a
machine and/or user logon session by setting either or both of the
following REG_DWORD values in the registry using REGEDIT.EXE:

    HKEY_LOCAL_MACHINE\Software\Microsoft\Command Processor\EnableExtensions

        and/or

    HKEY_CURRENT_USER\Software\Microsoft\Command Processor\EnableExtensions

to either 0x1 or 0x0.  The user specific setting takes precedence over
the machine setting.  The command line switches take precedence over the
registry settings.

In a batch file, the SETLOCAL ENABLEEXTENSIONS or DISABLEEXTENSIONS arguments
takes precedence over the /E:ON or /E:OFF switch. See SETLOCAL /? for details.

The command extensions involve changes and/or additions to the following
commands:

    DEL or ERASE
    COLOR
    CD or CHDIR
    MD or MKDIR
    PROMPT
    PUSHD
    POPD
    SET
    SETLOCAL
    ENDLOCAL
    IF
    FOR
    CALL
    SHIFT
    GOTO
    START (also includes changes to external command invocation)
    ASSOC
    FTYPE

To get specific details, type commandname /? to view the specifics.

Delayed environment variable expansion is NOT enabled by default.  You
can enable or disable delayed environment variable expansion for a
particular invocation of CMD.EXE with the /V:ON or /V:OFF switch.  You
can enable or disable delayed expansion for all invocations of CMD.EXE on a
machine and/or user logon session by setting either or both of the
following REG_DWORD values in the registry using REGEDIT.EXE:

    HKEY_LOCAL_MACHINE\Software\Microsoft\Command Processor\DelayedExpansion

        and/or

    HKEY_CURRENT_USER\Software\Microsoft\Command Processor\DelayedExpansion

to either 0x1 or 0x0.  The user specific setting takes precedence over
the machine setting.  The command line switches take precedence over the
registry settings.

In a batch file the SETLOCAL ENABLEDELAYEDEXPANSION or DISABLEDELAYEDEXPANSION
arguments takes precedence over the /V:ON or /V:OFF switch. See SETLOCAL /?
for details.

If delayed environment variable expansion is enabled, then the exclamation
character can be used to substitute the value of an environment variable
at execution time.

You can enable or disable file name completion for a particular
invocation of CMD.EXE with the /F:ON or /F:OFF switch.  You can enable
or disable completion for all invocations of CMD.EXE on a machine and/or
user logon session by setting either or both of the following REG_DWORD
values in the registry using REGEDIT.EXE:

    HKEY_LOCAL_MACHINE\Software\Microsoft\Command Processor\CompletionChar
    HKEY_LOCAL_MACHINE\Software\Microsoft\Command Processor\PathCompletionChar

        and/or

    HKEY_CURRENT_USER\Software\Microsoft\Command Processor\CompletionChar
    HKEY_CURRENT_USER\Software\Microsoft\Command Processor\PathCompletionChar

with the hex value of a control character to use for a particular
function (e.g.  0x4 is Ctrl-D and 0x6 is Ctrl-F).  The user specific
settings take precedence over the machine settings.  The command line
switches take precedence over the registry settings.

If completion is enabled with the /F:ON switch, the two control
characters used are Ctrl-D for directory name completion and Ctrl-F for
file name completion.  To disable a particular completion character in
the registry, use the value for space (0x20) as it is not a valid
control character.

Completion is invoked when you type either of the two control
characters.  The completion function takes the path string to the left
of the cursor appends a wild card character to it if none is already
present and builds up a list of paths that match.  It then displays the
first matching path.  If no paths match, it just beeps and leaves the
display alone.  Thereafter, repeated pressing of the same control
character will cycle through the list of matching paths.  Pressing the
Shift key with the control character will move through the list
backwards.  If you edit the line in any way and press the control
character again, the saved list of matching paths is discarded and a new
one generated.  The same occurs if you switch between file and directory
name completion.  The only difference between the two control characters
is the file completion character matches both file and directory names,
while the directory completion character only matches directory names.
If file completion is used on any of the built in directory commands
(CD, MD or RD) then directory completion is assumed.

The completion code deals correctly with file names that contain spaces
or other special characters by placing quotes around the matching path.
Also, if you back up, then invoke completion from within a line, the
text to the right of the cursor at the point completion was invoked is
discarded.

The special characters that require quotes are:
     <space>
     &()[]{}^=;!'+,`~

::::::::::::::::::::

Usage: jar {ctxui}[vfm0Me] [jar-file] [manifest-file] [entry-point] [-C dir] files ...
Options:
    -c  create new archive
    -t  list table of contents for archive
    -x  extract named (or all) files from archive
    -u  update existing archive
    -v  generate verbose output on standard output
    -f  specify archive file name
    -m  include manifest information from specified manifest file
    -e  specify application entry point for stand-alone application
        bundled into an executable jar file
    -0  store only; use no ZIP compression
    -M  do not create a manifest file for the entries
    -i  generate index information for the specified jar files
    -C  change to the specified directory and include the following file

If any file is a directory then it is processed recursively.
The manifest file name, the archive file name and the entry point name are
specified in the same order as the 'm', 'f' and 'e' flags.

Example 1: to archive two class files into an archive called classes.jar:
       jar cvf classes.jar Foo.class Bar.class
Example 2: use an existing manifest file 'mymanifest' and archive all the
           files in the foo/ directory into 'classes.jar':
       jar cvfm classes.jar mymanifest -C foo/ .

::::::::::::::::::::

FINDSTR [/B] [/E] [/L] [/R] [/S] [/I] [/X] [/V] [/N] [/M] [/O] [/P] [/F:file]
        [/C:string] [/G:file] [/D:dir list] [/A:color attributes] [/OFF[LINE]]
        strings [[drive:][path]filename[ ...]]

  /B         Matches pattern if at the beginning of a line.
  /E         Matches pattern if at the end of a line.
  /L         Uses search strings literally.
  /R         Uses search strings as regular expressions.
  /S         Searches for matching files in the current directory and all
             subdirectories.
  /I         Specifies that the search is not to be case-sensitive.
  /X         Prints lines that match exactly.
  /V         Prints only lines that do not contain a match.
  /N         Prints the line number before each line that matches.
  /M         Prints only the filename if a file contains a match.
  /O         Prints character offset before each matching line.
  /P         Skip files with non-printable characters.
  /OFF[LINE] Do not skip files with offline attribute set.
  /A:attr    Specifies color attribute with two hex digits. See "color /?"
  /F:file    Reads file list from the specified file(/ stands for console).
  /C:string  Uses specified string as a literal search string.
  /G:file    Gets search strings from the specified file(/ stands for console).
  /D:dir     Search a semicolon delimited list of directories
  strings    Text to be searched for.
  [drive:][path]filename
             Specifies a file or files to search.

Use spaces to separate multiple search strings unless the argument is prefixed
with /C.  For example, 'FINDSTR "hello there" x.y' searches for "hello" or
"there" in file x.y.  'FINDSTR /C:"hello there" x.y' searches for
"hello there" in file x.y.

Regular expression quick reference:
  .        Wildcard: any character
  *        Repeat: zero or more occurrences of previous character or class
  ^        Line position: beginning of line
  $        Line position: end of line
  [class]  Character class: any one character in set
  [^class] Inverse class: any one character not in set
  [x-y]    Range: any characters within the specified range
  \x       Escape: literal use of metacharacter x
  \<xyz    Word position: beginning of word
  xyz\>    Word position: end of word

For full information on FINDSTR regular expressions refer to the online Command Reference.

://////////////////////////////////////////////////

::  List the classes in a jar file
::  jar -tvf jarfile | findstr /C:".class"

::  Find all the jar files in a folder
::  Dir /B /S *.jar

::  Search all jars in the current directory & below, for the class file

if ""%1""=="""" GOTO noPARAM

::  FOR /F "tokens=*" %%G IN ('DIR /B /S .\*.jar') DO jar -tf "%%G" | findstr /R /C:"/%1.class"

::  FOR %I IN (*.jar) DO @(FOR /F %J IN ('jar tf %I') DO ECHO "%J: %I") | FINDSTR /R /C:"/String.class$"

FORFILES /S /M *.jar /C "CMD /c jar -tf @file | FINDSTR /R /C:"/%1.class" && (ECHO "--------------------" & ECHO.@path & ECHO."--------------------")"

GOTO END

:noPARAM

ECHO "usage: %0 <class>"

:END

