#!/bin/bash

#Install and enable Docker-ce
sudo apt update
sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce -y
sudo systemctl start docker
sudo systemctl enable docker

#Install docker registry
sudo docker run -d -p 5000:5000 --restart=always --name registry registry:2
