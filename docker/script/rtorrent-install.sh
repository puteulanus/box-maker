#!/bin/bash

# Install
yum install rtorrent -y

# Configuration
mkdir -p /usr/www/rtorrent/{.session,torrent,download}
cp /tmp/conf/rtorrent.rc /usr/www/.rtorrent.rc
chown -R www:www /usr/www/