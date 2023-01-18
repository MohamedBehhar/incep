#!/bin/sh

# if [ -e /tmp/wp-config.php ]; then
# 	echo "** creating wp-config file"
# 	envsubst '$MYSQL_DATABASE $MYSQL_USER $MYSQL_PASSWORD' < /tmp/wp-config.php > /var/www/wordpress/wp-config.php
# 	rm -f /tmp/wp-config.php
# fi

#!/bin/bash

set -x

if [ -z "$DB_HOST" ]; then
    echo "WORDPRESS_DB_HOST not set"
    exit 1
fi

if [ -z "$MYSQL_USER" ]; then
    echo "WORDPRESS_DB_USER not set"
    exit 1
fi

if [ -z "$MYSQL_PASSWORD" ]; then
    echo "WORDPRESS_DB_PASSWORD not set"
    exit 1
fi

if [ -z "$MYSQL_DATABASE" ]; then
    echo "WORDPRESS_DB_NAME not set"
    exit 1
fi

if [ ! -f /var/www/wordpress/wp-config.php ]; then
    echo "***********"
fi
cd var/www/wordpress
ls
# sleep 3
# Copy the original WordPress config file
cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

# Set the language
php language core install en_US 
wp core language install en_US --activate

# Set the site title
wp option update blogname "My Site Title"

# Create an admin user
wp user create admin admin@example.com --role=administrator --user_pass=password

# Set the database details with the environment variables
echo "************************"
echo $MYSQL_DATABASE
echo "************************"
sed -i "s/database_name_here/$MYSQL_DATABASE/g" /var/www/wordpress/wp-config.php
sed -i "s/username_here/$MYSQL_USER/g" /var/www/wordpress/wp-config.php
sed -i "s/password_here/$MYSQL_PASSWORD/g" /var/www/wordpress/wp-config.php
sed -i "s/localhost/$DB_HOST/g" /var/www/wordpress/wp-config.php

chown -R www-data:www-data /var/www/wordpress

php-fpm7 -F

exec "$@"