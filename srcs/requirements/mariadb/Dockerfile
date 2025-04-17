FROM debian:buster-slim

# Install MariaDB
RUN apt-get update && apt-get install -y \
	  mariadb-server \
	  mariadb-client \
		gettext-base && \
	rm -rf /var/lib/apt/lists/*

COPY conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

# Mysqld setup
RUN mkdir -p /run/mysqld

# Setup db
COPY tools/init.sql      /etc/mysql/init.sql
COPY tools/script.sh    mariadb_script.sh
RUN chmod +x            mariadb_script.sh

# Execute the mariadb setup script when entering the container
ENTRYPOINT [ "./mariadb_script.sh" ]