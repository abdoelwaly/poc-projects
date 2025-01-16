# adding repository and installing nginx		
apt update
apt install nginx -y
cat <<EOT > pocapp
upstream pocapp {

 server app01:8080;

}

server {

  listen 80;

location / {

  proxy_pass http://pocapp;

}

}

EOT

mv pocapp /etc/nginx/sites-available/pocapp
rm -rf /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/pocapp /etc/nginx/sites-enabled/pocapp

#starting nginx service and firewall
systemctl start nginx
systemctl enable nginx
systemctl restart nginx
