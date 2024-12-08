#!/bin/bash

service mariadb start

sleep 2

mysql -e "CREATE DATABASE IF NOT EXISTS \`$MYSQLDB\`;"
mysql -e "CREATE USER IF NOT EXISTS \`$MYSQLUSER\`@'%' IDENTIFIED BY \`$MYSQLPASS\`;"
mysql -e "GRANT ALL PRIVILEGES ON \`$MYSQLDB\`.* TO \`$MYSQLUSER\`@'%' IDENTIFIED BY \`$MYSQLPASS\`;"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQLROOTPASS';"
mysql -u root -p$MYSQLROOTPASS -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$MYSQLROOTPASS shutdown

exec "$@"

