-include .env
export

up:
	@docker-compose up -d

down:
	@docker-compose down

exec:
	@docker exec -it $(shell docker ps -q) bash

# Runs pg_prove for all files ending with .sql (default .pg) in the tests/ folder.
.PHONY: tests
tests:
	@docker exec -it $(shell docker ps -q) pg_prove -U ${DB_USER} -d ${DB_NAME} --verbose --ext .sql -r tmp/tests/
