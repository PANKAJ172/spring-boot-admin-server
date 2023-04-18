#!/bin/bash

folder_path="/home/ubuntu/spring-boot-admin-server"

owner=$(stat -c '%U' $folder_path)
if ["$owner" == "ubuntu"] then
    cd spring-boot-admin-server
    echo ""
else
    sudo chown -R ubuntu:ubuntu ../spring-boot-admin-server
fi

if [ -x "$(command -v docker)" ]; then
    echo "Docker already available"
    echo ""
else
    echo "Installing Docker"
    echo ""
    #  Install Docker
    #curl -fsSL https://get.docker.com -o get-docker.sh
    sudo apt install docker.io -y
fi

#if [ -x "$(command -v docker)" ]; then
#    echo "Docker Compose already available"
#    echo ""
#else
#    echo "Installing docker-compose"
#    echo ""
#    sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#    sudo chmod +x /usr/local/bin/docker-compose
#fi

docker-compose up -d
