FROM debian:stable

WORKDIR /mariadb

RUN apt update && apt install mariadb-server -y

RUN sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/setupDB.sh .

RUN chmod +x ./setupDB.sh

CMD [ "./setupDB.sh" ]