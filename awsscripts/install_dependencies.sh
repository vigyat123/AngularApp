#!/bin/bash

set -e

CATALINA_HOME=/usr/share/tomcat7-codedeploy

# Tar file name
TOMCAT7_CORE_TAR_FILENAME='apache-tomcat-7.0.72.tar.gz'
# Download URL for Tomcat7 core
TOMCAT7_CORE_DOWNLOAD_URL="https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.72/bin/$TOMCAT7_CORE_TAR_FILENAME"
# The top-level directory after unpacking the tar file
TOMCAT7_CORE_UNPACKED_DIRNAME='apache-tomcat-7.0.72'


# Check whether there exists a valid instance
# of Tomcat7 installed at the specified directory
[[ -d $CATALINA_HOME ]] && { service tomcat7 status; } && {
    echo "Tomcat7 is already installed at $CATALINA_HOME. Skip reinstalling it."
    exit 0
}

# Clear install directory
if [ -d $CATALINA_HOME ]; then
    rm -rf $CATALINA_HOME
fi
mkdir -p $CATALINA_HOME

# Download the latest Tomcat7 version
cd /tmp
{ which wget; } || { yum install wget; }
wget $TOMCAT7_CORE_DOWNLOAD_URL
if [[ -d /tmp/$TOMCAT7_CORE_UNPACKED_DIRNAME ]]; then
    rm -rf /tmp/$TOMCAT7_CORE_UNPACKED_DIRNAME
fi
tar xzf $TOMCAT7_CORE_TAR_FILENAME

# Copy over to the CATALINA_HOME
cp -r /tmp/$TOMCAT7_CORE_UNPACKED_DIRNAME/* $CATALINA_HOME
NODE_HOME=/home/ec2-user/.nvm/versions/node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
. ~/.nvm/nvm.sh
 nvm install 6.11.5   
 node -e "console.log('Running Node.js ' + process.version)"
