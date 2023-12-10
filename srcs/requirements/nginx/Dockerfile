FROM debian:stable

WORKDIR /etc/nginx/ssl
RUN apt-get update && apt-get install nginx openssl -y && \
    openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
    -subj "/CN=${DOMAIN_NAME}" \
    -keyout cert.key -out cert.crt
# req = certificate request 
# -new = generate new certificate request 
# -node = do not encrypt the private key ==> for development and testing only
# -x509 = self signed certificate 

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off ;"]