console:
	docker compose exec api rails c || docker compose run api rails c

start:
	docker compose up -d

stop:
	docker compose down

logs:
	docker compose logs -f

migrate:
	docker compose exec api rails db:migrate || docker compose run api rails db:migrate

debug:
	docker attach superparty-api-1
