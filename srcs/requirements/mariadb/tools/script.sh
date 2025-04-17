#!/bin/bash

export WP_DB_PASSWORD=$(cat /run/secrets/db_password)
export WP_DB_ROOT_PASSWORD=$(cat /run/secrets/db_root_password)

envsubst < /etc/mysql/init.sql > /tmp/init.sql

# Install the db
mysql_install_db
mysqld --init-file=/tmp/init.sql