FROM debian:12.5

RUN apt update -y && apt upgrade -y && apt install -y mariadb-server

RUN mkdir -p /var/lib/mysql
RUN mkdir -p /run/mysqld

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
CMD [ "mysqld" ]