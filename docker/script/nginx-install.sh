#!/bin/bash

# Install
yum install -y nginx

# Main Configure
mkdir -p /root/default/{public_html,logs}
sed -i "s/user  nginx/user root root/g" /etc/nginx/nginx.conf

# Site Configure
sed -i 's/default_server//' /etc/nginx/nginx.conf
cp /tmp/conf/default.conf /etc/nginx/conf.d/default.conf