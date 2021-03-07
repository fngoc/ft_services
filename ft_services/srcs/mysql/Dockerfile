FROM alpine:3.12

RUN apk update
RUN apk upgrade
RUN apk add sudo vim mysql mysql-client \
    openrc mariadb mariadb-common mariadb-client \
    telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN mkdir -p /run/mysqld/

COPY ./telegraf.conf /etc/telegraf/
COPY ./wordpress.sql /
COPY ./my.cnf /etc/
COPY ./start.sh /tmp/
RUN sudo chmod -R 755 /var/lib/mysql/
RUN chmod +x tmp/start.sh

EXPOSE 3306

CMD tmp/start.sh