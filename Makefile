build:
	docker-compose -f ./srcs/docker-compose.yml up --build -d


build-no-cache:
	docker-compose -f ./srcs/docker-compose.yml build --no-cache

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	docker-compose -f ./srcs/docker-compose.yml down -v

re:
	make down
	make clean
	sudo rm -rf /home/ybel-hac/data/wordpress/* /home/ybel-hac/data/mariadb/*
	make