#!/bin/bash

# Setting password
sed -i "s/THE_PASSWORD/$(cat /etc/passwd.txt)/g" /usr/www/transmission/config/settings.json
sed -i "s/21232f297a57a5a743894a0e4a801fc3/$(cat /etc/passwd.txt | md5sum | awk '{print $1}')/g" /usr/www/default/public_html/data/system/member.php
sed -i "s/THE_PASSWORD/$(cat /etc/passwd.txt)/g" /etc/supervisord.d/c9.ini
htpasswd -nb admin $(cat /etc/passwd.txt) >> /usr/www/default/public_html/ruT/.htpasswd
chown www:www /usr/www/default/public_html/ruT/.htpasswd
mv /var/run/box-maker/crypt.js /usr/www/rtorrent/flood/
mkdir /usr/www/rtorrent/flood/server/db
cat <<_EOF_ > /usr/www/rtorrent/flood/server/db/users.db
{"username":"admin","password":"THE_PASSWORD","_id":"IBYplwpjv2PdOOAX"}
{"$$indexCreated":{"fieldName":"username","unique":true,"sparse":false}}
_EOF_
sed -i "s/THE_PASSWORD/$(/usr/bin/node /usr/www/rtorrent/flood/crypt.js $(cat /etc/passwd.txt))/g" /usr/www/rtorrent/flood/server/db/users.db
chown -R www:www /usr/www/rtorrent/flood/server/db
rm -f /usr/www/rtorrent/flood/crypt.js

# Public password
curl 'http://gb.weather.gov.hk/cgi-bin/hko/localtime.pl' > /usr/www/default/public_html/time.txt
openssl rsautl -encrypt -in /etc/passwd.txt -inkey /var/run/box-maker/RSA.pub -pubin -out /usr/www/default/public_html/password.txt

# Clean
rm -rf /etc/passwd.txt
rm -rf /var/run/box-maker/RSA.pub

# Fix permission
bash /var/run/box-maker/permission-fix.sh >/dev/null 2>&1 &

# Run heart beat script
bash /var/run/box-maker/heartbeat.sh >/dev/null 2>&1 &

# Run supervisor
supervisord -nc /etc/supervisord.conf