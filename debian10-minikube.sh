#!/bin/bash

#############################
#Install and enable Docker-ce
#############################
sudo apt update
sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce -y
sudo systemctl start docker
sudo systemctl enable docker


##############
#Minikube
##############

#Add current user to Docker group - Docker without sudo
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker

#Get Minikube. Assuming 64-bit here.
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

#Install minikube
sudo install minikube-linux-amd64 /usr/local/bin/minikube

#Start Minikube
minikube start

#Enable addons
minikube addons enable ingress

#Get kubectl
minikube kubectl -- get po -A
