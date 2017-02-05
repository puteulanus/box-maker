#!/bin/bash

# Install
yum install rtorrent -y

# Configuration
mkdir -p /usr/www/rtorrent/{.session,torrent,download,ruTorrent}
cp /tmp/conf/rtorrent.rc /usr/www/.rtorrent.rc
cd /usr/www/rtorrent/ruTorrent/
wget -O ruTorrent.zip 'https://github.com/Novik/ruTorrent/archive/master.zip'
unzip ruTorrent.zip
mv ruTorrent-master/* ./
mv ruTorrent-master/.htaccess ./
rm -rf ruTorrent-master
chown -R www:www /usr/www/