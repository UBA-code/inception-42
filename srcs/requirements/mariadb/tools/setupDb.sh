#!/bin/bash

echo "SCRIPT START RUNNING ..."

service mariadb start

echo "\
CREATE DATABASE IF NOT EXISTS ${DB_NAME};\n\
CREATE USER IF NOT EXISTS '${DB_ADMIN}'@'%' IDENTIFIED BY '${DB_PASSWD}';\n\
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_ADMIN}'@'%' IDENTIFIED BY '${DB_PASSWD}';\n\
FLUSH PRIVILEGES;" > script


mysql < script

sleep .5

service mariadb stop

mysqld_safe