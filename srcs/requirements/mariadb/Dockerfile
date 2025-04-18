FROM debian:bookworm

# Install MariaDB
RUN apt-get update && apt-get install -y \
    mariadb-server \
    mariadb-client \
    gettext-base

# MariaDB config
COPY conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

# Ensure necessary directories exist
RUN mkdir -p /run/mysqld /var/lib/mysql

# Copy scripts
COPY tools/init.sql      /etc/mysql/init.sql
COPY tools/script.sh    /usr/local/bin/mariadb_script.sh
RUN chmod +x /usr/local/bin/mariadb_script.sh

# Run script
ENTRYPOINT ["/usr/local/bin/mariadb_script.sh"]
