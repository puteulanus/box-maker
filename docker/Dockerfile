FROM centos:centos7

# Add scripts
ADD script /tmp/script

# Add configs
ADD conf /tmp/conf

# Update sources
RUN bash /tmp/script/source-update.sh

# Install Useful tools
RUN yum install -y wget tar unzip openssl

# Install PHP
RUN bash /tmp/script/php-install.sh

# Install Nginx
RUN bash /tmp/script/nginx-install.sh

# Install File Manager
RUN bash /tmp/script/fm-install.sh

# Install rtorrent
RUN bash /tmp/script/rtorrent-install.sh

# Install Cloud9
RUN bash /tmp/script/c9-install.sh

# Setup Startup
RUN bash /tmp/script/run-when-start.sh

# ADD Run
ADD run /var/run/box-maker

# RClone
RUN yum install -y rclone

# Clean
RUN rm -rf /tmp/*

# Expose Ports
EXPOSE 80
EXPOSE 444
EXPOSE 3306
EXPOSE 3306/udp

ENV PASSWORD admin

# RUN
CMD ["bash", "/var/run/box-maker/run.sh"]
