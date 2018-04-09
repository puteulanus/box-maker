#!/bin/bash

# PHP
yum install epel-release -y
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
sed -i -e '/\[remi\]/,/^\[/s/enabled=0/enabled=1/' /etc/yum.repos.d/remi.repo
sed -i -e '/\[remi\-php72\]/,/^\[/s/enabled=0/enabled=1/' /etc/yum.repos.d/remi-php72.repo

# Nginx
cat << _EOF_ >/etc/yum.repos.d/nginx.repo
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/7/x86_64/
gpgcheck=0
enabled=1
_EOF_

# Update
yum update -y