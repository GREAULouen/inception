SECRETS_DIR := secrets
SRC_DIR := srcs

all: build up

build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down

logs:
	docker-compose logs -f

restart:
	docker-compose restart

re: down all