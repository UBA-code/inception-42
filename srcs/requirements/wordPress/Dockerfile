FROM debian:stable

RUN apt-get update && \
    apt-get install php-fpm php-mysql wget -y

RUN mkdir -p /var/www/html/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/setupWP.sh /

RUN chmod +x /setupWP.sh

CMD [ "/setupWP.sh" ]