FROM centos:centos7

USER root

RUN yum update -y \
	&& yum install -y java \
		openssh-server \
		git \
	&& groupadd -g 990 docker  \
	&& useradd -u 1000 -G docker jenkins \
	&& mkdir -p /home/jenkins/.ssh \
		/var/jenkins_home \
	&& /usr/sbin/sshd-keygen \
	&& curl -fsSL https://get.docker.com | bash \
	&& curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
	&& chmod +x /usr/local/bin/docker-compose 

COPY slave-key.pub /home/jenkins/.ssh/authorized_keys

RUN chown jenkins:jenkins -R /home/jenkins/.ssh/ \
	&& chmod 700 /home/jenkins/.ssh \
  && chown jenkins:jenkins /jenkins \
	&& chmod 600 /home/jenkins/.ssh/authorized_keys	

CMD /usr/sbin/sshd -D