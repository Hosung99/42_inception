all : build

build :
	docker compose -f ./srcs/docker-compose.yml up

clean :
	docker compose -f ./srcs/docker-compose.yml down

fclean :
	docker compose -f ./srcs/docker-compose.yml down -v

re :
	fclean
	build

.PHONY: all re clean fclean