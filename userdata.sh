#!/bin/bash

yum update -y
yum install -y \
	vim \
	wget \
	awscli \
	git 

groupadd -g 1050 docker
curl -fsSL https://get.docker.com | bash
usermod -aG docker centos
systemctl enable docker && systemctl start docker

curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/sbin/docker-compose
chmod +x /usr/local/sbin/docker-compose

mkdir -p /jenkins/master
fdisk /dev/xvdb <<EOF
n
p
1


w
EOF
partprobe
mkfs -t xfs /dev/xvdb1
echo "/dev/xvdb1  /jenkins/master  xfs  defaults  0 0" >>/etc/fstab
mount -a 

cd /jenkins
git clone --branch dev https://github.com/sabukittu/jenkins.git
cd jenkins

chown centos:docker -R /jenkins
docker-compose up -d jenkins
sleep 300
aws s3 cp /jenkins/master/secrets/initialAdminPassword s3://backup-noobies/jenkins/initialAdminPassword.txt