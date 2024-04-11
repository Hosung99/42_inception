all : build

build :
	docker compose -f ./srcs/docker-compose.yml up -d

clean :
	docker compose -f ./srcs/docker-compose.yml down

fclean :
	docker compose -f ./srcs/docker-compose.yml down -v
	docker system prune
	docker image prune -a

re : fclean all

.PHONY: all re clean fclean
