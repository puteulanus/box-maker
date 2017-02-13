#!/bin/bash

while true
do
    chown www:www -R /usr/www
    chmod a+rw -R /usr/www
    sleep 1
done