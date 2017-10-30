#!/bin/bash

set -e

CATALINA_HOME=/usr/share/tomcat7
if [[ (-d $CATALINA_HOME) && (service tomcat7 status) ]]; then
    echo "Tomcat7 is already installed at $CATALINA_HOME. Skip reinstalling it."
else
sudo yum install tomcat7 tomcat7-webapps
fi
