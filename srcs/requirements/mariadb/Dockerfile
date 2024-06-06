FROM debian:12.5

RUN apt update -y && apt upgrade -y && apt install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/init.sql /etc/mysql/init.sql

RUN mkdir -p /run/mysqld

CMD [ "mysqld" ]