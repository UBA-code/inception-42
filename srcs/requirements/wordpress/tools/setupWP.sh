#! /bin/bash

echo "WordPress setup started ..."

wp config create --dbname=$DB_NAME --dbuser=$DB_ADMIN --dbpass=$DB_ADMIN_PASSWD --dbhost=mariadb --force --allow-root

wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --allow-root

if wp core install --url=$DOMAIN_NAME --title=inception \
    --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWD \
    --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root ; then
    wp user create $WP_USER $WP_EMAIL --user_pass=$WP_PASSWD --role=$WP_ROLE --allow-root
    wp plugin install redis-cache --activate --allow-root
    wp redis enable --allow-root
    php-fpm8.2 -F # fast cgi process manager
else
    echo "mariadb server not ready yet!"
fi


# * PHP-FPM (FastCGI Process Manager) is an implementation of the FastCGI protocol specifically designed for use with PHP.
# * It works by starting a pool of worker processes that are responsible for executing PHP scripts.
# * When a web server receives a request for a PHP script, it passes the request to one of the worker processes, which then executes the script and returns the result to the web server.
# * This allows PHP scripts to be executed more efficiently, as the worker processes can be reused for multiple requests.