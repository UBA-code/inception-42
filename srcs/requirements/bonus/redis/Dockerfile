FROM debian:stable

RUN apt-get update && apt-get install redis-server -y

RUN echo "maxmemory 256mb" >> /etc/redis/redis.conf

RUN echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf

RUN sed -i "s/bind 127.0.0.1/#bind 127.0.0.1/" /etc/redis/redis.conf

CMD [ "redis-server", "--protected-mode", "no"]