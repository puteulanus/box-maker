#!/bin/bash

# Install
yum install -y nginx

# Main Configure
groupadd www
useradd -g www www
usermod -s /sbin/nologin www
mkdir -p /usr/www/default/{public_html,logs}
chmod -R +w /usr/www/
chown -R www:www /usr/www/
chmod a+w /usr/www/default/public_html
sed -i "s/#user  nobody/user  www www/g" /etc/nginx/nginx.conf
sed -i "s/#worker_processes  1/worker_processes  4/g" /etc/nginx/nginx.conf
sed -i "s/#error_log  logs\/error.log/error_log  logs\/error.log crit/g" /etc/nginx/nginx.conf
sed -i "s/#pid/pid/g" /etc/nginx/nginx.conf
sed -i '/worker_connections/ i use epoll;' /etc/nginx/nginx.conf

# Site Configure
cp /tmp/conf/default.conf /etc/nginx/conf.d/default.conf