FROM alpine:3.11

RUN apk update && \
	apk add --no-cache wget tar gettext \
	php7-fpm php7-mysqli php7-json

RUN wget https://wordpress.org/latest.tar.gz && \
	tar -xvf latest.tar.gz && \
	mkdir -p /var/www/wordpress && \
	mv wordpress/* /var/www/wordpress/ && \
	rm -rf latest.tar.gz wordpress
RUN apk add curl && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN apk add --no-cache php php-cli




# COPY ./conf/wordpress /var/www/
# RUN rm -rf /var/www/wp-config-sample.php
# RUN mkdir /var/www/wordpress
COPY ./conf/www.conf /etc/php7/php-fpm.d/
COPY ./tools/entrypoint.sh .
# COPY ./backup/ /var/www/wordpress
COPY ./conf/wp-config.php /var/www/wordpress

EXPOSE 9000

# ENTRYPOINT ["./docker-entrypoint.sh"]
ENTRYPOINT ["./entrypoint.sh"]
CMD ["php-fpm7", "-F"]







