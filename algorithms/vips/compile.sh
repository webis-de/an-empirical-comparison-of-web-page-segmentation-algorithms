#!/bin/bash

# Make sure we are in the same directory as this file
pushd $(dirname "${BASH_SOURCE[0]}") >/dev/null 2>&1

if [ -e webis-web-archiver.jar ];then
  echo "Using existing webis-web-archiver.jar"
else
  echo "Downloading JAR of the Webis Web Archiver for compilation"
  wget https://github.com/webis-de/webis-web-archiver/releases/download/0.1.0/webis-web-archiver.jar
fi

echo "Compiling script class src/main/java/VIPSScript.class"
javac -cp "webis-web-archiver.jar:." \
  --release 8 \
  src/main/java/VIPSScript.java

echo "Creating script JAR"
jar cfM scripts/VIPSScript-1.0.0/VIPSScript.jar \
  -C src/main/java VIPSScript.class

