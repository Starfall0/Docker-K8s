#! /bin/bash
apt update && apt install -y nginx
cp /www/src /var/www/html
cp /www/images /var/www/html
systemctl restart nginx
echo "Nginx is running on port 80"