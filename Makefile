DOCKER_COMPOSE = docker compose -f src/docker-compose.yml
VOLUMES_DIR = /home/$(USER)/data
DATA_BASE = mariadb
WORDPRESS = wordpress
NGINX = nginx

# Targets


pre-up:
	mkdir -p $(VOLUMES_DIR)/database
	mkdir -p $(VOLUMES_DIR)/wordpress
up:
	$(DOCKER_COMPOSE) up --build

down:
	$(DOCKER_COMPOSE) down  --remove-orphans 
	docker image prune -f

restart: down up

clean_volumes: down
	sudo rm -rf $(VOLUMES_DIR)

fclean: clean_volumes
	docker system prune -a 

nginx_shell:
	$(DOCKER_COMPOSE) exec $(NGINX) /bin/bash

wordpress_shell:
	$(DOCKER_COMPOSE) exec $(WORDPRESS) /bin/bash

database_shell:
	$(DOCKER_COMPOSE) exec $(DATA_BASE) /bin/bash

# Optional: Add a target to view logs
logs:
	$(DOCKER_COMPOSE) logs -f



.PHONY: up down restart clean nginx_shell wordpress_shell database_shell build logs