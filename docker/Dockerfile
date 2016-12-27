FROM centos:centos7

# Add scripts
ADD script /tmp/script

# Add configs
ADD conf /tmp/conf

# Add passwd
ADD passwd.txt /tmp/passwd.txt

# Update sources
RUN bash /tmp/script/source-update.sh

# Install Useful tools
RUN yum install -y wget tar unzip socat

# Install PHP
RUN bash /tmp/script/php-install.sh

# Install Nginx
RUN bash /tmp/script/nginx-install.sh

# Install File Manager
RUN bash /tmp/script/fm-install.sh

# Install transmission
RUN bash /tmp/script/transmission-install.sh

# Setup Startup
RUN bash /tmp/script/run-when-start.sh

# Expose Ports
EXPOSE 80
EXPOSE 443
EXPOSE 3306
EXPOSE 3306/udp

# RUN
CMD ["supervisord", "-nc", "/etc/supervisord.conf"]