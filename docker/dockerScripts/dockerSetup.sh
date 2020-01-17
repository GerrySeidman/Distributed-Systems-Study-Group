#!/bin/bash
DOCKER_REGISTRY_HOST="kube-1"
DOCKER_REGISTRY_IP="10.128.0.6" #This depends on your registry IP, not a universal setting
DOCKER_REGISTRY_PORT="5000"
KUBE_MASTER="kube-master"
KUBE_NODES="kube-1,kube-2,kube-3"
NODE=$(hostname)

sudo apt-get update
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker

if [ $NODE -eq $DOCKER_REGISTRY_HOST];
then
  sudo docker run -d -p 5000:5000 --restart=always --name my-private-registry registry:2
fi

sudo echo "{ \"insecure-registries\":[\"$DOCKER_REGISTRY_HOST:$DOCKER_REGISTRY_PORT\",\"$DOCKER_REGISTRY_IP:$DOCKER_REGISTRY_PORT\"] }" > /etc/docker/daemon.json
