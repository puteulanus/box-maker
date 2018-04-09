#!/bin/bash

# Install
curl --silent --location https://rpm.nodesource.com/setup_8.x | bash -
yum install nodejs -y
mkdir /root/rtorrent/flood
cd /root/rtorrent/flood
wget -q -O flood.zip 'https://github.com/jfurrow/flood/archive/master.zip'
unzip flood.zip
mv flood-master/* ./
rm -rf flood-master flood.zip
npm install node-gyp bcrypt-nodejs

# Configure
cp /tmp/conf/config.js /root/rtorrent/flood/
npm install
npm run build