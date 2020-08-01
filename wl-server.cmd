@ECHO OFF

GOTO //////////////////////////////////////////////////

::::::::::  WebLogic App Server

  :: Default settings
  JAVA Memory arguments: -Xms256m -Xmx512m -XX:CompileThreshold=8000 -XX:PermSize=128m  -XX:MaxPermSize=256m

  :: As a general rule, set initial heap size (-Xms) equal to maximum heap size (-Xmx), to minimize garbage collection

::::::::::  eCare 1.0 jars placed in domain's lib folder

 Volume in drive L is OSDisk
 Volume Serial Number is FEAE-54BD

 Directory of L:\local-400\lib

07/31/2020  03:59 PM    <DIR>          .
07/31/2020  03:59 PM    <DIR>          ..
06/19/2007  08:38 AM            73,425 avalon-framework.jar
06/19/2007  08:38 AM         2,111,580 batik.jar
06/19/2007  08:38 AM            22,327 commons-logging-api.jar
06/19/2007  08:38 AM         1,519,742 fop.jar
01/31/2010  02:23 PM           160,967 jaxen-core.jar
01/31/2010  02:23 PM             5,949 jaxen-jdom.jar
01/31/2010  02:23 PM           135,368 jdom.jar
01/31/2010  02:24 PM            23,563 saxpath.jar
               9 File(s)      4,053,629 bytes
               2 Dir(s)  138,474,250,240 bytes free


::::::::::  Eclipse how does it

C:\java\jdk8\bin\java -server -Xdebug -Xnoagent -Xrunjdwp:transport=dt_socket,address=8453,server=y,suspend=n -Djava.compiler=NONE 

-Xms256m -Xmx512m -XX:CompileThreshold=8000 -XX:PermSize=128m 
-XX:MaxPermSize=256m -Dweblogic.Name=AdminServer 
-Djava.security.policy=C:\Apps\WebLogic\wlserver\server\lib\weblogic.policy  
-Xverify:none -Djava.endorsed.dirs=C:\java\jdk8\jre\lib\endorsed;C:\Apps\WebLogic\oracle_common\modules\endorsed  
-ea -da:com.bea... 
-da:javelin... 
-da:weblogic... 
-ea:com.bea.wli... 
-ea:com.bea.broker... 
-ea:com.bea.sbconsole... 
-Dwls.home=C:\Apps\WebLogic\wlserver\server -Dweblogic.home=C:\Apps\WebLogic\wlserver\server      weblogic.Server

Listening for transport dt_socket at address: 8453

://////////////////////////////////////////////////

if ""%1""=="""" GOTO howTO

::::::::::  setup JVM Debugger variables
set JVM_DEBUG_PORT=8453
set JVM_DEBUG=-Xdebug -Xnoagent -Xrunjdwp:transport=dt_socket,address=%JVM_DEBUG_PORT%,server=y,suspend=n -Djava.compiler=NONE



SET WEB_APP_COLOR=07

::::::::::  pick which domain to launch
if ""%1""==""ecare"" (
  SET WEB_APP_TITLE=DEV DB eCare
  SET WEB_APP_LOC=local-eCARE
) else (
  SET WEB_APP_TITLE=DEV DB - server %1
  SET WEB_APP_LOC=local-%1

  ::  SET CLASSPATH=D:\CA_Harvest\ecenter_jar\*;C:\Apps\eCenter\properties;%CLASSPATH%
  SET CLASSPATH=C:\Apps\eCenter\ecenterdev\properties;%CLASSPATH%
)


:: set Log4J=-Dlog4j.debug -Dlog4j.configuration=log4j-dev.properties
   set Log4J=-Dlog4j.debug

::::::::::  stop or start the Server
if ""%2""==""0"" (
  ::  Stop Weblogic Application Server
  CALL C:\Apps\WebLogic\user_projects\domains\%WEB_APP_LOC%\bin\stopWebLogic.cmd
) else (
  TITLE %WEB_APP_TITLE%
  COLOR %WEB_APP_COLOR%

    :: Increase WebLogic heap size
    set USER_MEM_ARGS=-Xms1024m -Xmx1024m

    :: WebLogic App Server (JVM)
    set JAVA_OPTIONS=%JVM_DEBUG%;%Log4J%

    ::  Start Weblogic Application Server
    CALL C:\Apps\WebLogic\user_projects\domains\%WEB_APP_LOC%\startWebLogic.cmd
)


GOTO END

:howTO

ECHO "usage: %0 <server #> <[0 = stop]>"

:END

