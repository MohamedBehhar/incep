COMPOSE_FILE=./srcs/docker-compose.yml


all: run


run:
	sudo mkdir -p /home/mbehhar/data/wordpress
	sudo mkdir -p /home/mbehhar/data/mariadb
	echo "127.0.0.1    mbehhar.42.fr" | sudo tee -a /etc/hosts
	docker-compose -f $(COMPOSE_FILE) up --build


up:
	sudo mkdir -p /home/mbehhar/data/wordpress
	sudo mkdir -p /home/mbehhar/data/mariadb
	docker-compose -f $(COMPOSE_FILE) up --build

stop:
	docker-compose -f $(COMPOSE_FILE) stop
down:
	docker-compose -f $(COMPOSE_FILE) down -v
	sudo rm -rf /home/mbehhar/data/wordpress
	sudo rm -rf /home/mbehhar/data/mariadb


