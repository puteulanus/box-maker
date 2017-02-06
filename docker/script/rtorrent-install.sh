#!/bin/bash

# Install
yum install rtorrent httpd-tools -y

# Configuration
mkdir -p /usr/www/rtorrent/{.session,torrent,download,ruTorrent}
cp /tmp/conf/rtorrent.rc /home/www/.rtorrent.rc
chown www:www /home/www/.rtorrent.rc
cd /usr/www/rtorrent/ruTorrent/
wget -O ruTorrent.zip 'https://github.com/Novik/ruTorrent/archive/master.zip'
unzip ruTorrent.zip
mv ruTorrent-master/* ./
mv ruTorrent-master/.htaccess ./
rm -rf ruTorrent-master ruTorrent.zip

ln -s /usr/www/rtorrent/ruTorrent /usr/www/default/public_html/ruT
rm -rf /usr/www/default/public_html/data/User/admin/home/download
ln -s /usr/www/rtorrent/download /usr/www/default/public_html/data/User/admin/home/download

chown -h www:www /usr/www/default/public_html/ruT
chown -h www:www /usr/www/default/public_html/data/User/admin/home/download
chown -R www:www /usr/www/