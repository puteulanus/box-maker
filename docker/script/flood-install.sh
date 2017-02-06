#!/bin/bash

# Install
curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -
yum install nodejs -y
mkdir /usr/www/rtorrent/flood
cd /usr/www/rtorrent/flood
wget -O flood.zip 'https://github.com/jfurrow/flood/archive/master.zip'
unzip flood.zip
mv flood-master/* ./
rm -rf flood-master flood.zip

# Configure
cp /tmp/conf/config.js /usr/www/rtorrent/flood/
npm install --production
chown -R www:www /usr/www/rtorrent/flood