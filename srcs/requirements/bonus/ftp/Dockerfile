FROM debian:stable

RUN apt-get update && apt-get install vsftpd -y

COPY ./tools/setupFTP.sh script.sh

RUN chmod +x script.sh

CMD [ "/script.sh"]