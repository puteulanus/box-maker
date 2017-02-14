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
sed -i "s#define('KOD_SESSION',   DATA_PATH .'session/');#define('KOD_SESSION',   '/tmp/' .'session/');#" /usr/www/default/public_html/config/config.php
echo -e "\n\n\$config['setting_system_default']['new_user_app'] = '';" >> /usr/www/default/public_html/config/setting.php
echo "\$config['setting_default']['recycle_open'] = '0';" >> /usr/www/default/public_html/config/setting.php
echo 'unset($config["setting_menu_default"][3]);' >> /usr/www/default/public_html/config/setting.php
mkdir -p /usr/www/default/public_html/data/User/admin/{data,home,recycle}
mkdir /usr/www/default/public_html/data/User/admin/home/desktop
rm -f /usr/www/default/public_html/data/system/system_member.php
rm -f /usr/www/default/public_html/data/system/system_group.php
#rm -f /usr/www/default/public_html/data/system/system_setting.php
cp /tmp/conf/fm/system_member.php /usr/www/default/public_html/data/system/system_member.php
cp /tmp/conf/fm/system_group.php /usr/www/default/public_html/data/system/system_group.php
#cp /tmp/conf/fm/system_setting.php /usr/www/default/public_html/data/system/system_setting.php
cp /tmp/conf/fm/config.php /usr/www/default/public_html/data/User/admin/data/config.php

cp /tmp/conf/fm/*.oexe /usr/www/default/public_html/data/User/admin/home/desktop/

rm -f /usr/www/default/public_html/lib/update.php
rm -f /usr/www/default/public_html/data/session/index.html

chown -R www:www /usr/www/
chmod -R a+w /usr/www/default/public_html
