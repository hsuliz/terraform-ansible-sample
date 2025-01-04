#!/bin/bash

sudo dnf check-update --refresh
sudo dnf upgrade --refresh

sudo dnf install docker -y
sudo systemctl start docker

#sudo docker pull hsuliz/test:2-0-0
sudo docker run -d -p 80:8080 hsuliz/test:2-0-0