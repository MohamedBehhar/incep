COMPOSE_FILE=./srcs/docker-compose.yml


all: run


run:
	sudo mkdir -p /home/moha/data/wordpress
	sudo mkdir -p /home/moha/data/mariadb
	echo "127.0.0.1    https://mbehhar.42.fr" | sudo tee -a /etc/hosts
	docker compose -f $(COMPOSE_FILE) up --build

up:
	sudo mkdir -p /home/moha/data/wordpress
	sudo mkdir -p /home/moha/data/mariadb
	docker compose -f $(COMPOSE_FILE) up --build

down:
	docker compose -f $(COMPOSE_FILE) down

	sudo rm -rf /home/moha/data/wordpress
	sudo rm -rf /home/moha/data/mariadb
