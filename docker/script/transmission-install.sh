#!/bin/bash

# Install
yum install transmission transmission-daemon -y

# Configure
mkdir -p /usr/www/transmission/{config,download}
cp /tmp/conf/settings.json /usr/www/transmission/config/
chown -R www:www /usr/www/
chmod -R a+w /usr/www/transmission

ln -s /usr/www/transmission/download /usr/www/default/public_html/download