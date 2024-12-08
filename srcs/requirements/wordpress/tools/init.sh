#!/bin/bash

sleep 5

wp config set DB_NAME $MYSQLDB
wp config set DB_USER $MYSQLUSER
wp config set DB_PASSWORD $MYSQLPASS
wp config set DB_HOST 'mariadb:3306'

wp core install --allow-root \
    --url="https://hfilali.42.fr" \
    --title="Inception" \
    --admin_user=$WPADMIN \
    --admin_password=$WPADMINPASS \
    --admin_email="hfilali@student.1337.ma";

wp user create --allow-root --role="contributor" $WPUSER "hatim.filali@usmba.ac.ma" --user_pass=$WPUSERPASS

wp theme install twentytwentytwo --activate --allow-root

wp plugin update --all --allow-root

exec "$@"