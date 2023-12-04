#! /bin/bash

echo "WordPress setup started ..."

if wp config create --dbname=$DB_NAME --dbuser=$DB_ADMIN --dbpass=$DB_ADMIN_PASSWD --dbhost=mariadb --force --allow-root ; then
    wp core install --url=$DOMAIN_NAME --title=inception \
    --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWD \
    --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
    wp user create $WP_USER $WP_EMAIL --user_pass=$WP_PASSWD --role=$WP_ROLE --allow-root
    php-fpm8.2 -F
else
    echo "mariadb server not ready yet!"
fi