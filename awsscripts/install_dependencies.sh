#!/bin/bash

set -e

CATALINA_HOME=/usr/share/tomcat7
if [[ (-d $CATALINA_HOME) && (service tomcat7 status) ]]; then
    echo "Tomcat7 is already installed at $CATALINA_HOME. Skip reinstalling it."
else
sudo yum install tomcat7 tomcat7-webapps
fi
NODE_HOME=/home/ec2-user/.nvm/versions/node
if [ -d $NODE_HOME ]; then
echo "NodeJS is already installed at $NODE_HOME. Skip reinstalling it."
else
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
. ~/.nvm/nvm.sh
 nvm install 6.11.5   
 node -e "console.log('Running Node.js ' + process.version)"
fi
