FROM alpine:3.18

RUN apk update --no-cache && \
	apk add --no-cache mariadb mariadb-client

COPY ./tools/init.sh /
COPY ./tools/mariadb-server.conf /etc/mysql/mycnf.d/

COPY --chmod=644 ./tools/my.cnf /etc/my.cnf
COPY --chmod=644 ./tools/mariadb-server.conf /etc/my.cnf.d/mariadb-server.cnf

RUN chmod +x /init.sh

CMD ["/init.sh"]
