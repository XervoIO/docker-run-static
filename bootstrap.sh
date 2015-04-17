#!/bin/bash
set -e
set -x

export HOME=/root
export TEMP_DIR=/root/tmp

# Install nginx
echo "deb http://ppa.launchpad.net/nginx/stable/ubuntu $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/nginx-stable.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C
sudo apt-get update -y
sudo apt-get install -y nginx=1.6.3-1+trusty0
echo "daemon off;" >> /etc/nginx/nginx.conf
rm /etc/nginx/sites-enabled/default
cp /opt/modulus/conf/nginx-default /etc/nginx/sites-enabled/default
mkdir /var/lib/nginx/body
