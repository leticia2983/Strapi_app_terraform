#!/bin/bash
sudo apt-get update
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash
sudo apt install -y nodejs
sudo npm install -g yarn
sudo npm install -g strapi
sudo npm install -g pm2
sudo mkdir -p /home/ubuntu/srv/strapi
sudo chown -R ubuntu:ubuntu /home/ubuntu/srv/strapi
sudo chmod -R 755 /home/ubuntu/srv/strapi
cd /home/ubuntu/srv/strapi
git config --global user.name "leticia2983"
git config --global user.email "leticia888444@gmail.com"
git clone https://github.com/leticia2983/Strapi_app_terraform.git .

cat <<EOT > .env
HOST=0.0.0.0
PORT=1337
APP_KEYS="toBeModified1,toBeModified2"
API_TOKEN_SALT=tobemodified
ADMIN_JWT_SECRET=tobemodified
TRANSFER_TOKEN_SALT=tobemodified
JWT_SECRET=tobemodified
EOT

npm install
npm run build

pm2 start npm --name "strapi" -- run develop --cwd /home/ubuntu/srv/strapi
pm2 save
pm2 startup

sudo env PATH=$PATH:/usr/bin pm2 startup systemd -u ubuntu --hp /home/ubuntu

echo "Setup complete. Strapi is running and accessible at http://<your-ec2-instance-public-ip>:1337"

