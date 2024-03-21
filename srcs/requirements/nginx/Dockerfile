FROM alpine:3.18

RUN apk update --no-cache && \
	apk add --no-cache nginx openssl &&             \
    adduser -u 1000 -D -h /var/www www &&   \
    chown -R www:www /var/www

COPY ./tools/init.sh /

RUN chmod +x /init.sh

CMD ["/init.sh"]