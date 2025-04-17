#!/bin/bash

export WP_DB_PASSWORD=$(cat /run/secrets/db_password)
export WP_DB_ROOT_PASSWORD=$(cat /run/secrets/db_root_password)

envsubst < /etc/mysql/init.sql > /etc/mysql/tmp.sql
mv /etc/mysql/tmp.sql /etc/mysql/init.sql

# Install the db
mysql_install_db
mysqld --init-file=/etc/mysql/init.sql