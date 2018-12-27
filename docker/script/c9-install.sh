#!/bin/bash

# Install
yum install -y gcc glibc-static make
yum -y install tmux which
yum install -y git
cd /usr/src/
git clone git://github.com/c9/core.git c9sdk
cd c9sdk
scripts/install-sdk.sh
scripts/install-sdk.sh