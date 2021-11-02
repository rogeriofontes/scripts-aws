#!/bin/bash
sudo yum update -y
yum install git -yy
git clone https://github.com/rogeriofontes/nginx-site.git /home/ec2-user/site-content
sudo amazon-linux-extras install docker -y
sudo usermod -aG docker ec2-userd
sudo service docker start
sudo chmod 777 /var/run/docker.sock
docker run -it --rm -d -p 8080:80 --name web -v ~/site-content:/usr/share/nginx/html nginx
