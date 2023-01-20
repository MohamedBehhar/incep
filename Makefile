COMPOSE_FILE=./srcs/docker-compose.yml


all: run


run:
	sudo mkdir -p /home/mbehhar/data/wordpress
	sudo mkdir -p /home/mbehhar/data/mariadb
	docker-compose -f $(COMPOSE_FILE) up --build

up:
	sudo mkdir -p /home/mbehhar/data/wordpress
	sudo mkdir -p /home/mbehhar/data/mariadb
	docker-compose -f $(COMPOSE_FILE) up --build

down:
	docker-compose -f $(COMPOSE_FILE) down

	sudo rm -rf /home/mbehhar/data/wordpress
	sudo rm -rf /home/mbehhar/data/mariadb
