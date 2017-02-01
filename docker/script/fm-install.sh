#!/bin/bash

# Download
cd /usr/www/default/public_html
wget https://github.com/kalcaddle/KODExplorer/archive/3.23.zip
unzip 3.23.zip
rm -rf 3.23.zip
mv KODExplorer-3.23/* ./
rm -rf KODExplorer-3.23

# Configure
touch /usr/www/default/public_html/data/system/install.lock
rm -f /usr/www/default/public_html/data/system/member.php
cp /tmp/conf/member.php /usr/www/default/public_html/data/system/member.php

chown -R www:www /usr/www/
chmod -R a+w /usr/www/default/public_html
