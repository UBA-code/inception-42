#!/bin/bash

echo "WordPress Setup started ..."

# sleep 10
cd /var/www/html/

wp core download --allow-root

cp wp-config-sample.php wp-config.php

sed -i "s/database_name_here/${DB_NAME}/" wp-config.php
sed -i "s/username_here/${DB_ADMIN}/" wp-config.php
sed -i "s/password_here/${DB_PASSWD}/" wp-config.php
sed -i "s/localhost/mariadb-container/" wp-config.php

wp core install --url=127.0.0.1 --title=${SITE_TITLE} --admin_user=${WP_ADMIN_USER} \
    --admin_password=${WP_ADMIN_PASSWD} --admin_email=${ADMIN_EMAIL} --allow-root

php-fpm8.2 -F -R # -F = foreground, -R == running for root