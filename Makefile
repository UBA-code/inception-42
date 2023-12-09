build:
	docker-compose -f ./srcs/docker-compose.yml up --build -d


build-no-cache:
	docker-compose -f ./srcs/docker-compose.yml build --no-cache

down:
	docker-compose -f ./srcs/docker-compose.yml kill

clean:
	docker-compose -f ./srcs/docker-compose.yml down -v

re:
	make down
	make clean
	rm -rf data/wordpress/* && rm -rf data/mariadb/*
	make