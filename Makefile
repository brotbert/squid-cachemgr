build:
	docker-compose build

up:
	docker-compose up -d
	./bin/socat-proxy.sh

run:
	docker-compose run --rm app /bin/bash

clean:
	docker-compose kill
	docker-compose rm -f

setup:
	@docker-machine create dev --driver virtualbox --virtualbox-disk-size 10000
	@make env

ip:
	@docker-machine ip dev

env:
	@docker-machine env dev
