
@ECHO OFF


GOTO //////////////////////////////////////////////////

NET USE [driveletter:] /DELETE

://////////////////////////////////////////////////

if ""%1""=="""" GOTO noPARAM

::  Disconnect network drive

net use %1: /DELETE

GOTO END

:noPARAM

ECHO "usage: %0 <drive letter>"

:END
