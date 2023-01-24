#!/bin/sh
set -x


#Check if the database exists

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then 

	echo "Database already exists"
else

mysql_install_db

/etc/init.d/mysql start
# Set root option so that connexion without root password is not possible

mysql_secure_installation <<_EOF_

Y
root
root
Y
n
Y
Y
_EOF_


echo "CREATE USER IF NOT EXISTS root@localhost IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -u root
echo "SET PASSWORD FOR root@localhost = PASSWORD('$MYSQL_ROOT_PASSWORD');" | mysql -u root
echo "GRANT ALL ON *.* TO root@localhost WITH GRANT OPTION;" | mysql -u root
echo "CREATE USER IF NOT EXISTS root@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -u root
echo "SET PASSWORD FOR root@'%' = PASSWORD('$MYSQL_ROOT_PASSWORD');" | mysql -u root
echo "GRANT ALL ON *.* TO root@'%' WITH GRANT OPTION;" | mysql -u root
echo "CREATE USER IF NOT EXISTS $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -u root
echo "SET PASSWORD FOR $MYSQL_USER@'%' = PASSWORD('$MYSQL_PASSWORD');" | mysql -u root
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" | mysql -u root
echo "GRANT ALL ON $MYSQL_DATABASE.* TO $MYSQL_USER@'%';" | mysql -u root



/etc/init.d/mysql stop
fi

exec "$@"