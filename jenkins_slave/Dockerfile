FROM centos:centos7

USER root

RUN yum update -y \
	&& yum install -y java \
		openssh-server \
		git \
	&& groupadd -g 990 docker  \
	&& useradd -u 1000 -G docker jenkins \
	&& echo 'redhat@123' | passwd --stdin jenkins \
	&& mkdir -p /var/jenkins_home \
	&& chown jenkins:jenkins /var/jenkins_home \
	&& /usr/sbin/sshd-keygen \
	&& curl -fsSL https://get.docker.com | bash \
	&& curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
	&& chmod +x /usr/local/bin/docker-compose 	

VOLUME ["/var/jenkins_home"]

CMD /usr/sbin/sshd -D