#!/bin/bash

# Install
yum install -y gcc glibc-static make
yum -y install tmux which
yum install -y git
cd /usr/src/
git clone git://github.com/c9/core.git c9sdk
cd c9sdk
scripts/install-sdk.sh
yum install -y python-setuptools python-devel gcc-c++
easy_install pip
pip install -U virtualenv
virtualenv --python=python2 /root/.c9/python2
source /root/.c9/python2/bin/activate
mkdir /tmp/codeintel
pip download -d /tmp/codeintel codeintel==0.9.3
cd /tmp/codeintel
tar xf CodeIntel-0.9.3.tar.gz
mv CodeIntel-0.9.3/SilverCity CodeIntel-0.9.3/silvercity
tar czf CodeIntel-0.9.3.tar.gz CodeIntel-0.9.3
pip install -U --no-index --find-links=/tmp/codeintel codeintel

# Clean
rm -rf /tmp/codeintel