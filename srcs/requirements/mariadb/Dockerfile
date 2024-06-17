FROM debian:buster-slim

# Install MariaDB
RUN apt-get update && apt-get install -y \
	  mariadb-server \
	  mariadb-client && \
	rm -rf /var/lib/apt/lists/*

# Mysqld setup
RUN mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

# Expose port 3306
EXPOSE 3306

# Setup db
COPY tools/script.sh    /usr/local/bin/
COPY conf/init.sql      /usr/local/bin/
RUN chmod +x            /usr/local/bin/script.sh
RUN chmod +x            /usr/local/bin/init.sql

# Execute the mariadb setup script when entering the container
ENTRYPOINT [ "/usr/local/bin/script.sh" ]

# Start MariaDB
CMD ["mysqld", "--bind-address=0.0.0.0"]