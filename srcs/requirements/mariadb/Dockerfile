FROM debian:buster

# Install MariaDB
RUN apt-get update && apt-get install -y mariadb-server && \
	rm -rf /var/lib/apt/lists/*

# Expose port 3306
EXPOSE 3306

# Start MariaDB
CMD ["mysqld"]