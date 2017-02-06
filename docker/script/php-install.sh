#!/bin/bash

# Install 
yum install -y php-fpm php-cli php-mysqlnd php-gd php-imap \
php-ldap php-odbc php-pear php-xml php-xmlrpc \
php-magickwand php-mbstring php-mcrypt php-devel \
php-mssql php-snmp php-soap php-tidy php-pecl-ssh2

# Configure
sed -i "s/daemonize = yes/daemonize = no/" /etc/php-fpm.conf
sed -i "s/user = apache/user = root/" /etc/php-fpm.d/www.conf
sed -i "s/group = apache/user = root/" /etc/php-fpm.d/www.conf