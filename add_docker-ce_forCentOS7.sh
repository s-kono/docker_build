#!/bin/bash -x
sudo yum -y install epel-release \
&& sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo \
&& sudo yum -y install docker-ce \
&& sudo systemctl start docker \
&& sudo systemctl enable $_ \
&& sudo docker ps -a \
&& sudo docker pull centos:7 \
&& sudo docker images
