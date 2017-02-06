#!/bin/bash

while true
do
    chown www:www -R /usr/www
    chmod +w -R /usr/www
    sleep 1
done