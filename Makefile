include .env
export $(shell sed 's/=.*//' .env)

run:
	go build -o out && ./out
	
stop:
	@echo "Stopping backend"
	@-pkill -SIGTERM -f "./out"
	@echo "Stopped backend"

restart: stop run

migrations:
	cd sql/schema && goose postgres $(DB_CONNECTION) up

generate_sql:
	sqlc generate

