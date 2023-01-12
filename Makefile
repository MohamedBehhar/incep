COMPOSE_FILE=./srcs/docker-compose.yml


all: run


run: 
	sudo mkdir -p /home/moha/data
	sudo mkdir -p /home/moha/mariadb_data
	docker compose -f $(COMPOSE_FILE) up --build

up:
	sudo mkdir -p /home/moha/data
	sudo mkdir -p /home/moha/mariadb_data
	docker compose -f $(COMPOSE_FILE) up --build

down:
	docker compose -f $(COMPOSE_FILE) down
	sudo rm -rf /home/moha/data
	sudo rm -rf /home/moha/mariadb_data
