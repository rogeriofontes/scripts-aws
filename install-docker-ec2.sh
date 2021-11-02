#!/bin/bash
sudo yum update -y
yum install git -yy
git clone https://github.com/rogeriofontes/nginx-site.git /home/ec2-user/site-content
sudo amazon-linux-extras install docker -y
sudo usermod -aG docker ec2-userd
sudo service docker start
sudo chmod 777 /var/run/docker.sock
docker run -it -d -p 80:80 --name nginx -v ~/site-content/nginxconf:/etc/nginx/conf.d -v ~/site-content/server1:/usr/share/nginx/html nginx
#docker run -it -d -p 80:80 --name nginx -v ~/site-content/nginxconf:/etc/nginx/conf.d -v ~/site-content/server1:/usr/share/nginx/html nginx

