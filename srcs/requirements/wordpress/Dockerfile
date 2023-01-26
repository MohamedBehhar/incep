FROM	debian:buster

WORKDIR /var/www/html/wordpress

RUN	apt-get -y update
RUN	apt-get -y install curl\
	php-fpm\
	php-cgi\
	php-mysql

RUN apt-get install wget && wget https://wordpress.org/latest.tar.gz && \
	tar -xvf latest.tar.gz && \
	mkdir -p /var/www/wordpress && \
	mv wordpress/* /var/www/wordpress/ && \
	rm -rf latest.tar.gz wordpress


COPY ./tools/entrypoint.sh .
ENTRYPOINT ["./entrypoint.sh"]

CMD [ "/usr/sbin/php-fpm7.3", "-F" ]




