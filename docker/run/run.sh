#!/bin/bash

# Write password
if [ -n $PASSWORD ];then  
    echo $PASSWORD > /etc/passwd.txt 
fi  

# Setting password
sed -i "s/THE_PASSWORD/$(cat /etc/passwd.txt)/g" /etc/supervisord.d/c9.ini
htpasswd -nb admin $(cat /etc/passwd.txt) >> /root/default/public_html/ruT/.htpasswd
mv /var/run/box-maker/crypt.js /root/rtorrent/flood/
mkdir /root/rtorrent/flood/server/db
cat <<_EOF_ > /usr/www/rtorrent/flood/server/db/users.db
{"username":"admin","password":"THE_PASSWORD","_id":"IBYplwpjv2PdOOAX"}
{"$$indexCreated":{"fieldName":"username","unique":true,"sparse":false}}
_EOF_
sed -i "s#THE_PASSWORD#$(/usr/bin/node /usr/www/rtorrent/flood/crypt.js $(cat /etc/passwd.txt))#g" /root/rtorrent/flood/server/db/users.db
sed -i "s/THE_PASSWORD/$(cat /etc/passwd.txt)/g" /root/default/public_html/data/User/admin/home/desktop/ruTorrent.oexe
sed -i "s/THE_PASSWORD/$(cat /etc/passwd.txt)/g" /root/default/public_html/data/User/admin/home/desktop/Flood.oexe
sed -i "s/THE_PASSWORD/$(cat /etc/passwd.txt)/g" /root/default/public_html/data/User/admin/home/desktop/Cloud9.oexe

# Clean
rm -rf /etc/passwd.txt
rm -rf /var/run/box-maker/RSA.pub
rm -f /usr/www/rtorrent/flood/crypt.js

# Run supervisor
supervisord -nc /etc/supervisord.conf