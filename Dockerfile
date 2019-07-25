
FROM alpine
MAINTAINER esskay


RUN apk add apache2 \
	&& adduser -D demo
ADD index.html /var/www/html/ 
ADD 00.conf /etc/apache2/conf.d/00.conf


CMD ["httpd", "-D", "FOREGROUND"]
EXPOSE 80



