FROM debian:stable

WORKDIR /etc/nginx/ssl
RUN apt update && apt install nginx openssl -y && \
    openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
    -subj "/CN=${DOMAIN_NAME}" \
    -keyout cert.key -out cert.crt

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off ;"]