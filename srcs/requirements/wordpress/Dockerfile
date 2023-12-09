FROM debian:stable


WORKDIR /var/www/html

RUN apt-get update && apt-get install php php-mysql php-fpm php-redis curl -y

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/bin/wp

RUN sed -i "s/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/" /etc/php/8.2/fpm/pool.d/www.conf

RUN wp core download --allow-root

COPY ./tools/setupWP.sh .

RUN chmod +x setupWP.sh

CMD [ "./setupWP.sh" ]