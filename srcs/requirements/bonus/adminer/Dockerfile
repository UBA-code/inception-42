FROM debian:stable


RUN apt-get update && apt-get install php php-fpm wget mariadb-server -y

RUN mkdir -p /var/www/html

RUN wget -O adminer.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

COPY ./tools/setupAdminer.sh /

RUN chmod +x /setupAdminer.sh

CMD [ "/setupAdminer.sh"]