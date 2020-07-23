@ECHO OFF


GOTO //////////////////////////////////////////////////

Key and Certificate Management Tool

Commands:

 -certreq            Generates a certificate request
 -changealias        Changes an entry's alias
 -delete             Deletes an entry
 -exportcert         Exports certificate
 -genkeypair         Generates a key pair
 -genseckey          Generates a secret key
 -gencert            Generates certificate from a certificate request
 -importcert         Imports a certificate or a certificate chain
 -importpass         Imports a password
 -importkeystore     Imports one or all entries from another keystore
 -keypasswd          Changes the key password of an entry
 -list               Lists entries in a keystore
 -printcert          Prints the content of a certificate
 -printcertreq       Prints the content of a certificate request
 -printcrl           Prints the content of a CRL file
 -storepasswd        Changes the store password of a keystore

Use "keytool -command_name -help" for usage of command_name

:::::::::::
A keyStore is used to store individual identity or certificate while
 trustStore is used to store other parties certificates signed by CA.

password (default) -> changeit


keytool -import -keystore cacerts -file test.cer
keytool -list       -keystore %JAVA_HOME%\jre\lib\security\cacerts -storepass changeit


Keystore type: jks
Keystore provider: SUN

Your keystore contains 91 entries
:::::::::::

://////////////////////////////////////////////////

::  Import certificate (.cer) to cacerts file


if ""%1""=="""" GOTO noPARAM

keytool -importcert -keystore %JAVA_HOME%\jre\lib\security\cacerts -alias %1 -file %1 -storepass changeit

GOTO END

:noPARAM

ECHO.
ECHO "usage: %0 <file.cer>"
ECHO.

:END
