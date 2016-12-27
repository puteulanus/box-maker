#!/bin/bash

# Install supervisor
yum install python-setuptools -y
easy_install supervisor

mkdir /etc/supervisord.d
echo_supervisord_conf > /etc/supervisord.conf
echo '[include]' >> /etc/supervisord.conf
echo 'files = supervisord.d/*.ini' >> /etc/supervisord.conf

cp /tmp/conf/nginx-php.ini /etc/supervisord.d/nginx-php.ini
cp /tmp/conf/transmission.ini /etc/supervisord.d/transmission.ini