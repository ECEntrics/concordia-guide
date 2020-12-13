build:
	@docker-compose -p concordia-guide build;
run:
	@docker-compose -p concordia-guide up -d
stop:
	@docker-compose -p concordia-guide down
stop-clean-data:
	@docker-compose -p concordia-guide down -v
clean-images:
	@docker rmi `docker images -q -f "dangling=true"`
