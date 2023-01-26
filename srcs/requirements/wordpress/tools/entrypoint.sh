#!/bin/sh

# install wp cli 
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# install wp core to be able to setup the website using commands
wp core download --allow-root
# make FastCGI Process Manager to listen on port 9000
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir /run/php


if [ ! -f /var/www/wordpress/wp-config.php ]; then
    echo "wordpress already exist"
fi

# Copy the original WordPress config file
cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
cd /var/www/wordpress/
cat wp-config.php

# Set the database details with the environment variables
sed -i "s/database_name_here/$MYSQL_DATABASE/g" /var/www/wordpress/wp-config.php
sed -i "s/username_here/$MYSQL_USER/g" /var/www/wordpress/wp-config.php
sed -i "s/password_here/$MYSQL_PASSWORD/g" /var/www/wordpress/wp-config.php
sed -i "s/localhost/$DB_HOST/g" /var/www/wordpress/wp-config.php

wp config create

# install wp and creat admin user 
wp core install --url=https://localhost --title=Inception --admin_user=${ADMIN_USER} --admin_password=${MYSQL_ROOT_PASSWORD} --admin_email=mbehhar@student.1337.ma --allow-root

# creat normal user 
wp user create ${MYSQL_USER} behharmohamed18@gmail.com --user_pass=${MYSQL_PASSWORD} --allow-root

# allow comments on the website 
wp option update comment_status open --allow-root

# give nginx the permission to access wp files
chown -R www-data:www-data /var/www/wordpress

exec "$@"


