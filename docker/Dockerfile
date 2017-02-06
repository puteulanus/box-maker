FROM centos:centos7

# Add scripts
ADD script /tmp/script

# Add configs
ADD conf /tmp/conf

# Add passwd
ADD passwd.txt /etc/passwd.txt

# Update sources
RUN bash /tmp/script/source-update.sh

# Install Useful tools
RUN yum install -y wget tar unzip socat openssl

# Install PHP
RUN bash /tmp/script/php-install.sh

# Install Nginx
RUN bash /tmp/script/nginx-install.sh

# Install File Manager
RUN bash /tmp/script/fm-install.sh

# Install transmission
RUN bash /tmp/script/transmission-install.sh

# Install rtorrent
RUN bash /tmp/script/rtorrent-install.sh

# Install Cloud9
RUN bash /tmp/script/c9-install.sh

# Install Flood
RUN bash /tmp/script/flood-install.sh

# Setup Startup
RUN bash /tmp/script/run-when-start.sh

# ADD Run
ADD run /var/run/box-maker

# Clean
RUN bash /tmp/script/clean.sh

# Expose Ports
EXPOSE 80
EXPOSE 443
EXPOSE 3306
EXPOSE 3306/udp

# RUN
CMD ["bash", "/var/run/box-maker/run.sh"]
