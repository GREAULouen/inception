FROM debian:bookworm

# Install MariaDB
RUN apt-get update && apt-get install -y \
    mariadb-server \
    mariadb-client \
    gettext-base && \
    rm -rf /var/lib/apt/lists/*

# MariaDB config
COPY conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

# Ensure necessary directories exist
RUN rm -rf /var/lib/mysql/* && \
    mkdir -p /run/mysqld /var/lib/mysql && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql

# Copy scripts
COPY tools/init.sql      /etc/mysql/init.sql
COPY tools/script.sh    /usr/local/bin/mariadb_script.sh
RUN chmod +x /usr/local/bin/mariadb_script.sh

# Run as mysql user
USER mysql

# Run script
ENTRYPOINT ["/usr/local/bin/mariadb_script.sh"]
