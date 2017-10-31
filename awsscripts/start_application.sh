#!/bin/bash

set -e
sudo su
TEMP_STAGING_DIR='/tmp/codedeploy-deployment-staging-area'
WAR_STAGED_LOCATION="$TEMP_STAGING_DIR/dist"
CONTEXT_PATH='ROOT'
if [[ -d $CATALINA_HOME/webapps/$CONTEXT_PATH ]]; then
    rm -rfv $CATALINA_HOME/webapps/$CONTEXT_PATH
fi
cp -r $WAR_STAGED_LOCATION/ $CATALINA_HOME/webapps/$CONTEXT_PATH
service tomcat7 start
