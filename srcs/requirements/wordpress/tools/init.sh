#!/bin/sh

su www

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

wp config create --force \
	--skip-check \
	--dbname=${MYSQL_DB_NAME} \
	--dbuser=${MYSQL_ROOT_USER} \
	--dbpass=${MYSQL_ROOT_PASSWORD} \
	--dbhost=mariadb

wp core install \
	--url=${DOMAIN_NAME} \
	--title=${WP_TITLE} \
	--admin_user=${WP_ADMIN} \
	--admin_password=${WP_ADMIN_PASSWORD} \
	--admin_email=${WP_ADMIN_EMAIL} \
	--skip-email \
	--allow-root

wp user create ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD}

chmod -R 777 /var/www

php-fpm81 -F
