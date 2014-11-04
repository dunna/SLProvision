#!/bin/bash
nodejsURL=http://nodejs.org/dist/node-latest.tar.gz
nodeApp=https://github.com/amirrajan/word-finder.git

yum install -y wget openssl-devel gcc-c++ make git
rm -r -f /usr/local/src
mkdir -p /usr/local/src
cd /usr/local/src
wget $nodejsURL
tar -zxvf ./node-latest.tar.gz
cd node-v*
./configure
make
make install
mkdir /home/nodejsapp/
cd /home/nodejsapp
git clone $nodeApp
cd word-finder
npm install
npm install -g forever
export PORT=8080
forever start server.js
