@ECHO OFF

GOTO //////////////////////////////////////////////////

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


set JVM_DEBUG_PORT=8453
set JVM_DEBUG=-Xdebug -Xnoagent -Xrunjdwp:transport=dt_socket,address=%JVM_DEBUG_PORT%,server=y,suspend=n -Djava.compiler=NONE


SET WEB_APP_TITLE=DEV database
SET WEB_APP_COLOR=07

if ""%1""==""ecare"" (
  SET WEB_APP_LOC=local-eCARE
)

if ""%1""==""ec1"" (
  SET WEB_APP_LOC=local-ec1

  ::  eCenter Core
  SET CLASSPATH=W:\CA_Harvest\ecenter_jar\*;C:\Apps\eCenter\properties;%CLASSPATH%
)

if ""%1""==""ecenter"" (
  SET WEB_APP_LOC=local-eCenter

  ::  eCenter Core
  SET CLASSPATH=W:\CA_Harvest\ecenter_jar\*;C:\Apps\eCenter\properties;%CLASSPATH%
)

if ""%1""==""test"" (
  SET WEB_APP_TITLE=TEST database
  SET WEB_APP_COLOR=0E

  SET WEB_APP_LOC=local-TEST

  ::  eCenter Core
  SET CLASSPATH=W:\CA_Harvest\ecenter_jar\*;C:\Apps\eCenter\properties;%CLASSPATH%
)


if ""%WEB_APP_LOC%""=="""" GOTO howTO


if ""%2""==""0"" (
  ::  Stop Weblogic Application Server
  CALL C:\Apps\WebLogic\user_projects\domains\%WEB_APP_LOC%\bin\stopWebLogic.cmd
) else (
  TITLE %WEB_APP_TITLE%
  COLOR %WEB_APP_COLOR%

    :: WebLogic App Server (JVM)
    set JAVA_OPTIONS=%JVM_DEBUG%

    ::  Start Weblogic Application Server
    CALL C:\Apps\WebLogic\user_projects\domains\%WEB_APP_LOC%\startWebLogic.cmd
)


GOTO END

:howTO

ECHO "usage: %0 <application [0 = stop] >"

:END

