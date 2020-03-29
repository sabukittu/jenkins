FROM jenkins/jenkins

USER root

RUN groupadd -g 990 docker \
	&& usermod -aG docker jenkins \
	&& curl -fsSL https://get.docker.com | bash \
	&& curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
	&& chmod +x /usr/local/bin/docker-compose