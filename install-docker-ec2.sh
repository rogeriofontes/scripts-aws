#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo usermod -aG docker ec2-userd
sudo service docker start
sudo chmod 777 /var/run/docker.sock
docker run -d -p 80:80 --name nginx nginx
