#!/bin/bash
curl -fsSL https://get.docker.com | sudo bash
sudo curl -fsSL "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo usermod -aG docker vagrant
docker volume create eudin
nano /var/lib/docker/volumes/eudin/_data index.html
docker service create --name eudin-app -dt -p 80:80 --mount type=volume,src=eudin,dst=/usr/local/apache2/htdocs/ httpd
