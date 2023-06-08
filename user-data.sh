#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y docker.io
sudo docker pull yezhyck/lab-4_5
sudo docker run --name lab-4_5 -p 80:80 -d yezhyck/lab-4_5
sudo docker run --name watchtower -v \
                /var/run/docker.sock:/var/run/docker.sock \
                -d containrrr/watchtower --schedule "1 * * * *"



