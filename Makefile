IMG_ONE = nginx-img
SRCS = ./srcs/docker-compose.yaml

build:
	docker-compose -f $(SRCS) build

build-no-cache:
	docker-compose -f $(SRCS) build --no-cache

up:
	docker-compose -f $(SRCS) up -d

down:
	docker-compose -f $(SRCS) down


clean:
	docker-compose -f $(SRCS) rm -f
