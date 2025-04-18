all: build up

build:
	mkdir -p /home/lgreau/data/mysql
	mkdir -p /home/lgreau/data/wordpress
	mkdir -p secrets
	echo "azerty" >> secrets/db_password.txt
	echo "azerty" >> secrets/db_root_password.txt
	docker compose build

up:
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs -f

restart:
	docker compose restart

re: down all