FROM debian:stable

RUN mkdir -p /mariadb/

WORKDIR /mariadb

RUN apt-get update && apt-get install mariadb-server -y

RUN sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/setupDb.sh .

RUN chmod +x setupDb.sh

CMD [ "/mariadb/setupDb.sh" ]