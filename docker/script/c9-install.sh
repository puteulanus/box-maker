#!/bin/bash

# Install
yum install git glibc-static which gcc -y
cd /usr/src
git clone git://github.com/c9/core.git c9sdk
cd c9sdk
scripts/install-sdk.sh