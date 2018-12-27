#!/bin/bash 

# Setting password
sed -i "s/THE_PASSWORD/${PASSWORD}/g" /etc/supervisord.d/c9.ini
htpasswd -nb admin ${PASSWORD} > /root/default/public_html/ruT/.htpasswd
sed -i "s/THE_PASSWORD/${PASSWORD}/g" /root/default/public_html/data/User/admin/home/desktop/ruTorrent.oexe
sed -i "s/THE_PASSWORD/${PASSWORD}/g" /root/default/public_html/data/User/admin/home/desktop/Cloud9.oexe

# Clean
rm -rf /etc/passwd.txt

# Run supervisor
supervisord -nc /etc/supervisord.conf