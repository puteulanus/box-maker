#!/bin/bash

# Setting password
sed -i "s/THE_PASSWORD/$(cat /etc/passwd.txt)/g" /usr/www/transmission/config/settings.json
sed -i "s/21232f297a57a5a743894a0e4a801fc3/$(cat /etc/passwd.txt | md5sum | awk '{print $1}')/g" /usr/www/default/public_html/data/system/member.php

# Public password
curl 'http://gb.weather.gov.hk/cgi-bin/hko/localtime.pl' > /usr/www/default/public_html/time.txt
openssl rsautl -encrypt -in /etc/passwd.txt -inkey /var/run/RSA.pub -pubin -out /usr/www/default/public_html/password.txt

# Clean
rm -rf /etc/passwd.txt
rm -rf /var/run/RSA.pub

# Run heart beat script
bash /var/run/box-maker/heartbeat.sh >/dev/null 2>&1 &

# Run supervisor
supervisord -nc /etc/supervisord.conf