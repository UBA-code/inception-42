#!/bin/bash

echo "WordPress Setup started ..."

cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/${DB_NAME}/" wp-config.php
sed -i "s/username_here/${DB_ADMIN}/" wp-config.php
sed -i "s/password_here/${DB_PASSWD}/" wp-config.php
sed -i "s/localhost/mariadb/" wp-config.php
sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf

if wp core install --url=$DOMAIN_NAME --title=${SITE_TITLE} --admin_user=${WP_ADMIN_USER} \
    --admin_password=${WP_ADMIN_PASSWD} --admin_email=${WP_ADMIN_EMAIL} --allow-root --skip-email; then
    wp user create $WP_USER $WP_USER_EMAIL --role=$WP_USER_ROLE --user_pass=$WP_USER_PASSWD --allow-root
    php-fpm8.2 -F -R # -F = foreground, -R == running for root
else
    echo "mariadb server not ready yet\n";
fi