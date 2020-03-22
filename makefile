build:
	@docker-compose -p apella-guide build;
run:
	@docker-compose -p apella-guide up -d
stop:
	@docker-compose -p apella-guide down
clean-data: 
	@docker-compose -p apella-guide down -v
clean-images:
	@docker rmi `docker images -q -f "dangling=true"`
