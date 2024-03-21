FROM alpine:3.18

RUN apk update --no-cache && \
	apk add --no-cache sudo php php-fpm php-cgi php-phar php-curl php-openssl php-mysqli php-tokenizer php-iconv fcgi curl && \
	adduser -u 1000 -D -h /var/www www &&   \
    chown -R www:www /var/www

WORKDIR /var/www

COPY ./tools/init.sh /
COPY ./tools/wp-config.php /
COPY --chmod=644 ./tools/www.conf /etc/php81/php-fpm.d/www.conf

RUN chmod +x /init.sh
RUN chmod +x /wp-config.php

CMD ["/init.sh"]