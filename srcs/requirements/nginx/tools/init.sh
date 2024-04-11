#!/bin/sh

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out $CERTS_ -subj "/C=KO/L=KH/O=1337/OU=student/CN=seoson.42.fr"

chmod -R 777 /var/lib/nginx/html

nginx -g "daemon off;"
