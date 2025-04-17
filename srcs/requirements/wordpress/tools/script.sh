#!/bin/bash
cd /var/www/html
curl -o /usr/local/bin/wp -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x /usr/local/bin/wp

WP_DB_PASSWORD=$(cat /run/secrets/db_password)

wp core download --allow-root

# Wordpress require mariaDB
until nc -z -w50 mariadb 3306
do
	echo "Waiting for MariaDB to start..."
	sleep 1
done

wp config create \
	--dbname=$WP_DB_NAME \
	--dbuser=$WP_DB_USER \
	--dbpass=$WP_DB_PASSWORD \
	--dbhost=$WP_DB_HOST \
	--allow-root \
	--quiet

wp core install \
	--url=localhost \
	--title=inception \
	--admin_user=$WP_ADMIN_USER \
	--admin_password=$WP_ADMIN_PASSWORD \
	--admin_email=$WP_ADMIN_EMAIL \
	--allow-root

wp user create \
	$WP_DB_USER \
	$WP_DB_USER_EMAIL \
	--user_pass=$WP_DB_PASSWORD \
	--role=author \
	--allow-root

chown -R www-data:www-data /var/www/html

php-fpm7.3 -F