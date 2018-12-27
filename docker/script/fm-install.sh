#!/bin/bash

# Download
cd /root/default/public_html
wget -q https://github.com/kalcaddle/KodExplorer/archive/master.zip
unzip master.zip
rm -rf master.zip
mv KodExplorer-master/* ./
rm -rf KodExplorer-master

# Configure
mkdir -p /root/default/public_html/data/User/admin/{data,home,recycle}
mkdir /root/default/public_html/data/User/admin/home/desktop
cp /tmp/conf/fm/*.oexe /root/default/public_html/data/User/admin/home/desktop/