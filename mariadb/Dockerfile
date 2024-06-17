FROM debian:12

RUN apt update && apt upgrade && apt install mariadb-server -y

RUN mkdir -p /run/mysqld/

COPY .env /.env
COPY mariadb.cnf /etc/mysql/mariadb.cnf
COPY mariadb_set_up.bash /mariadb_set_up.bash

RUN bash /mariadb_set_up.bash && rm /mariadb_set_up.bash /.env

RUN apt clean -y

CMD ["mariadbd"]
