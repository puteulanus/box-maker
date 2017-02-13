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
#touch /usr/www/default/public_html/data/system/install.lock
#rm -f /usr/www/default/public_html/data/system/member.php
cp /tmp/conf/system_member.php /usr/www/default/public_html/data/system/system_member.php
cp /tmp/conf/system_group.php /usr/www/default/public_html/data/system/system_group.php
mkdir /usr/www/default/public_html/data/User/admin
rm -f /usr/www/default/public_html/lib/update.php

chown -R www:www /usr/www/
chmod -R a+w /usr/www/default/public_html
