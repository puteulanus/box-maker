#!/bin/bash

# Install 
yum install -y php-fpm php-cli php-mbstring php-gd

# Configure
sed -i "s/daemonize = yes/daemonize = no/" /etc/php-fpm.conf
sed -i "s/user = apache/user = root/" /etc/php-fpm.d/www.conf
sed -i "s/group = apache/user = root/" /etc/php-fpm.d/www.conf
mkdir -p /run/php-fpm