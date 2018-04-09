#!/bin/bash

# Install
yum install rtorrent httpd-tools -y
rpm -ivh 'ftp://195.220.108.108/linux/rpmfusion/nonfree/fedora/updates/23/x86_64/u/unrar-5.4.5-1.fc23.x86_64.rpm'

# Configuration
mkdir -p /root/rtorrent/{.session,torrent,download,ruTorrent}
cp /tmp/conf/rtorrent.rc /root/.rtorrent.rc
cd /root/rtorrent/ruTorrent/
wget -O ruTorrent.zip 'https://github.com/Novik/ruTorrent/archive/master.zip'
unzip ruTorrent.zip
mv ruTorrent-master/* ./
mv ruTorrent-master/.htaccess ./
rm -rf ruTorrent-master ruTorrent.zip

ln -s /root/rtorrent/ruTorrent /root/default/public_html/ruT
rm -rf /root/default/public_html/data/User/admin/home/download
ln -s /root/rtorrent/download /root/default/public_html/data/User/admin/home/download
