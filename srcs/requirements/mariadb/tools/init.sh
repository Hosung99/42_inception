#!/bin/sh

/etc/init.d/mariadb setup

/usr/bin/mysqld_safe --datadir='/var/lib/mysql'

echo "
	create database if not exists $MYSQL_DB_NAME;
	create user if not exists '$MYSQL_ROOT_USER'@'localhost' identified by '$MYSQL_ROOT_PASSWORD';
	create user if not exists '$MYSQL_ROOT_USER'@'%' identified by '$MYSQL_ROOT_PASSWORD';
	GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES, CREATE VIEW, EVENT, TRIGGER, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, EXECUTE ON $MYSQL_DB_NAME.* TO '$MYSQL_ROOT_USER'@'%' WITH GRANT OPTION;
	FLUSH PRIVILEGES;
" > create_wordpressdb_user.sql

mysql -u root < create_wordpressdb_user.sql

mysqladmin -u root -p $MYSQL_ROOT_PASSWORD shutdown

/usr/bin/mysqld_safe
