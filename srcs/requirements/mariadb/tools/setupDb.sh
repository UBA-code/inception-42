#!/bin/bash

echo "MariaDB Setup started ..."

service mariadb start

echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_ADMIN}'@'%' IDENTIFIED BY '${DB_PASSWD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_ADMIN}'@'%' IDENTIFIED BY '${DB_PASSWD}';
FLUSH PRIVILEGES;" > script.sql

mariadb < script.sql

sleep .5

service mariadb stop

mysqld_safe