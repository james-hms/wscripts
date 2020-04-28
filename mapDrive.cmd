
@ECHO OFF


GOTO //////////////////////////////////////////////////


The NET Command is used to connect to a File/Printer Share as follows:

Join a file share (Drive MAP)
NET USE [driveletter:] \\ComputerName\ShareName /PERSISTENT:YES

NET USE [driveletter:] \\ComputerName\ShareName\folder1\folder2 /PERSISTENT:No

Make all future connections persistent (auto-reconnect at login)
NET USE /Persistent:Yes
or
NET USE /P:Yes

Make all future connections non-persistent (reconnect with login script)
NET USE /Persistent:No
or
NET USE /P:No

Join a file share (Drive MAP) - with a long share name
NET USE [driveletter:] "\\ComputerName\ShareName"

Connect a user to their HOME directory
NET USE [devicename | *] [password | *]] [/HOME]
This requires the users Home server/folder to be defined in ADUC

Join a password protected file share (Drive MAP)
NET USE [driveletter:] \\ComputerName\ShareName[\volume] [password | *] [/USER:[domainname\]username] [/PERSISTENT:No]

In the above command /USER can also be specified as:
[/USER:[dotted domain name\]username]
[/USER:[username@dotted domain name]

In a script, to map a drive and wait until the mapping has completed before continuing:
START /wait NET USE [driveletter:] \\ComputerName\ShareName
This will be a little slower, but ensures that files can be read from the mapped drive.

Join a Printer Share
NET USE [LPTx:] \\ComputerName\printer_share /PERSISTENT:YES

Join a Printer Share - with a "long" share name
NET USE [LPTx:] "\\ComputerName\printer_share"

Disconnect from a share
NET USE [driveletter:] /DELETE

Examples

NET USE G: "\\localhost\c$\Users\%Username%\Google Drive"

NET USE H: /Home
NET USE J: \\MainServer\Users\%Username%
NET USE W: \\MainServer\GroupShare /Persistent:No
NET USE \\MainServer\SharedPrinter

Notes:
NET USE command can map a network printer to an LPT port (for DOS type applications that print 
to a port.) but this does not add the printer to Control Panel - Printers.

By default all mapped drives have a 15 minute idle session timeout, you can modify this with 
the NET CONFIG command. In windows XP the explorer icon will change to show this change in status, 
this behaviour is to improve overall performance.

:::::::::::
Differences between net use & subst:

subst

When a share becomes unavailable subst will try over and over again to
 re-connect severely impacting performance of your PC as it tries to
 re-connect. This is less common when mapping local files as it will
 only occur if you say re-name the folders in the path. The
 resolution if this does occur is subst x: /d

net use

net use was introduced in win2k/xp to provide an alternative to this.
 When net use is used to connect to a location and that location
 becomes unreachable windows will report drive as disconnected and
 not try to re-connect until user tries to re-connect to resources
 on the mapped drive. This resolves the performance issues noted in subst
:::::::::::

://////////////////////////////////////////////////

if ""%3""=="""" GOTO noPARAM

::  Map network drive
::  net use H: \\[Server Name]\[Share Name] /user:[Logon Server]\[User Name] [Password] /persistent:no

net use %1: \\%2\%3

GOTO END

:noPARAM

ECHO "usage: %0 <drive letter> <ip address> <shareName>"

:END
