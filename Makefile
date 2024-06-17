USER := $(shell echo $$USER)

default: all

new_dirs: /home/$(USER)/data/db /home/$(USER)/data/wordpress

/home/$(USER)/data/db:
	mkdir -p /home/$(USER)/data/db

/home/$(USER)/data/wordpress:
	mkdir -p /home/$(USER)/data/wordpress

cpy_env: mariadb/.env

mariadb/.env:
	cp .env mariadb/.env

all: new_dirs cpy_env
	sudo env USER=$(USER) docker compose up --force-recreate --pull=never

fclean:
	-test -n "$$(sudo docker ps -a -q)" && sudo docker kill $$(sudo docker ps -a -q)
	sudo docker container prune -f
	sudo docker image prune -af
	-test -n "$$(sudo docker volume ls -q)" && sudo docker volume rm $$(sudo docker volume ls -q)
	sudo docker network prune -f
	sudo docker system prune -af
	sudo rm -rf /home/$(USER)/data/ mariadb/.env
