#!/bin/bash

# Download
cd /usr/www/default/public_html
wget https://github.com/kalcaddle/KODExplorer/archive/master.zip
unzip master.zip
rm -rf master.zip
mv KODExplorer-master/* ./
rm -rf KODExplorer-master

# Configure
touch /usr/www/default/public_html/data/system/install.lock
sed -i "s/21232f297a57a5a743894a0e4a801fc3/$(cat /tmp/passwd.txt | md5sum | awk '{print $1}')/g" /tmp/conf/member.php
rm -f /usr/www/default/public_html/data/system/member.php
cp /tmp/conf/member.php /usr/www/default/public_html/data/system/member.php
chown -R www:www /usr/www/
chmod -R a+w /usr/www/default/public_html