#!/bin/bash

# Download
cd /usr/www/default/public_html
#wget https://github.com/kalcaddle/KODExplorer/archive/3.23.zip
wget https://github.com/kalcaddle/KODExplorer/archive/master.zip
unzip master.zip
rm -rf master.zip
mv KODExplorer-master/* ./
rm -rf KODExplorer-master

# Configure
touch /usr/www/default/public_html/data/system/install.lock
mkdir -p /usr/www/default/public_html/data/User/admin/{data,home,recycle}
rm -f /usr/www/default/public_html/data/system/system_member.php
rm -f /usr/www/default/public_html/data/system/system_group.php
rm -f /usr/www/default/public_html/data/system/system_setting.php
cp /tmp/conf/fm/system_member.php /usr/www/default/public_html/data/system/system_member.php
cp /tmp/conf/fm/system_group.php /usr/www/default/public_html/data/system/system_group.php
cp /tmp/conf/fm/system_setting.php /usr/www/default/public_html/data/system/system_setting.php
cp /tmp/conf/fm/config.php /usr/www/default/public_html/data/User/admin/data/config.php

rm -f /usr/www/default/public_html/lib/update.php
rm -f /usr/www/default/public_html/data/session/index.html

chown -R www:www /usr/www/
chmod -R a+w /usr/www/default/public_html
