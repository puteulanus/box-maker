#!/bin/bash

# Download
cd /root/default/public_html
wget -q https://github.com/kalcaddle/KodExplorer/archive/master.zip
unzip master.zip
rm -rf master.zip
mv KodExplorer-master/* ./
rm -rf KodExplorer-master

# Configure
#touch /root/default/public_html/data/system/install.lock
#sed -i "s#define('KOD_SESSION',   DATA_PATH .'session/');#define('KOD_SESSION',   '/tmp/' .'session/');#" /root/default/public_html/config/config.php
#echo -e "\n\n\$config['setting_system_default']['new_user_app'] = '';" >> /root/default/public_html/config/setting.php
#echo "\$config['setting_default']['recycle_open'] = '0';" >> /root/default/public_html/config/setting.php
#echo 'unset($config["setting_menu_default"][3]);' >> /root/default/public_html/config/setting.php
mkdir -p /root/default/public_html/data/User/admin/{data,home,recycle}
mkdir /root/default/public_html/data/User/admin/home/desktop
#rm -f /root/default/public_html/data/system/system_member.php
#rm -f /root/default/public_html/data/system/system_group.php
#rm -f /usr/www/default/public_html/data/system/system_setting.php
#cp /tmp/conf/fm/system_member.php /root/default/public_html/data/system/system_member.php
#cp /tmp/conf/fm/system_group.php /root/default/public_html/data/system/system_group.php
#cp /tmp/conf/fm/system_setting.php /usr/www/default/public_html/data/system/system_setting.php
#cp /tmp/conf/fm/config.php /root/default/public_html/data/User/admin/data/config.php

cp /tmp/conf/fm/*.oexe /root/default/public_html/data/User/admin/home/desktop/
cp /tmp/conf/fm/flood.php /root/default/public_html/flood.php

#rm -f /root/default/public_html/lib/update.php
#rm -f /root/default/public_html/data/session/index.html
