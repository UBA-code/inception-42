#!/bin/bash

echo -e "MariaDB setup started ..."

service mariadb start

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_ADMIN'@'%' IDENTIFIED BY '$DB_ADMIN_PASSWD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_ADMIN'@'%' IDENTIFIED BY '$DB_ADMIN_PASSWD';
FLUSH PRIVILEGES;" > db.sql


mariadb < db.sql

sleep .5

service mariadb stop

mysqld_safe