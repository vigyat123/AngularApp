#!/bin/bash

set -e

sudo yum install tomcat7 tomcat7-webapps
NODE_HOME=/home/ec2-user/.nvm/versions/node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
. ~/.nvm/nvm.sh
 nvm install 6.11.5   
 node -e "console.log('Running Node.js ' + process.version)"
