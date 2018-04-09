#!/bin/bash

# Install
yum install rtorrent httpd-tools -y
rpm -Uvh 'ftp://195.220.108.108/linux/rpmfusion/nonfree/fedora/updates/23/x86_64/u/unrar-5.4.5-1.fc23.x86_64.rpm'
rpm -Uvh 'http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm'
yum install ffmpeg ffmpeg-devel -y
yum install mediainfo sox -y

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

sed -i "/\"php\"/s/''/'\/usr\/bin\/php'/" /root/default/public_html/ruT/conf/config.php
sed -i "/\"curl\"/s/''/'\/usr\/bin\/curl'/" /root/default/public_html/ruT/conf/config.php
sed -i "/\"gzip\"/s/''/'\/usr\/bin\/gzip'/" /root/default/public_html/ruT/conf/config.php
sed -i "/\"id\"/s/''/'\/usr\/bin\/id'/" /root/default/public_html/ruT/conf/config.php
sed -i "/\"stat\"/s/''/'\/usr\/bin\/stat'/" /root/default/public_html/ruT/conf/config.php
