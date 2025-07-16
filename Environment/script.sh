#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sleep 40
sudo apt install -y nginx php php-mysql unzip
mkdir -p /tmp/ritual
tar -xzf /home/ubuntu/ritual-roast-code.tar.gz -C /tmp/ritual
sudo cp -r /tmp/ritual/application-aws/* /var/www/html/
sudo systemctl restart nginx