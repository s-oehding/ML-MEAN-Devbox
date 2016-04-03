#!/usr/bin/env bash

#Set Variables passed from Vagrantfile
# --------------------
vm_ip="$1"
vm_hostname="$2"
vm_url="$3"
dbname="$4"
dbuser="$5"
dbpass="$6"


echo "Starting Provision"
echo "=========================================="

# Install & configure dependencies
# --------------------

apt-get update

#00 - Nginx
apt-get install -y nginx
# echo "server_names_hash_bucket_size 64;" >> /etc/nginx/nginx.conf
sudo rm /etc/nginx/sites-enabled/default
sudo rm /etc/nginx/sites-available/default
apt-get -y install tofrodos
fromdos /var/nginx_configs/default.sh
fromdos /var/nginx_configs/mongo.sh
fromdos /var/nginx_configs/dashboard.sh
sudo sh /var/nginx_configs/default.sh $vm_url
sudo sh /var/nginx_configs/mongo.sh $vm_url
# sudo sh /var/nginx_configs/dashboard.sh $vm_url
service nginx reload
sleep 60

#01 - NodeJs
apt-get install -y python-software-properties python g++ make
apt-get install -y build-essential
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
sudo apt-get install -y nodejs

#02 - MongoDb
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
apt-get update
apt-get install mongodb-10gen

#03 - Base NPM packages
npm install -g bower
# npm install -g grunt-cli
npm install -g gulp
# npm install -g foundation-cli
# npm install -g bootstrap-cli
npm install -g express
npm install -g forever

#04 -  Helpers
apt-get -y install git pv

# Set timezone
# --------------------
echo "Europe/Berlin" | tee /etc/timezone

# Install Admin Mongo
# --------------------
clear
cd /var/www/mongo
if [ ! -d "config" ]; then
  git clone https://github.com/mrvautin/adminMongo.git .
  npm install
fi

echo "=========================================="
echo "Provision VM finished"

# Make sure things are up and running as they should be
# --------------------
# service apache2 restart
