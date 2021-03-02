FROM alpine:3.12

RUN apk update
RUN apk upgrade
RUN apk add mysql mysql-client openrc mariadb

COPY ./start.sh /tmp/

RUN chmod +x tmp/start.sh

# RUN mkdir /var/run/mysqld
# RUN mkfifo /var/run/mysqld/mysqld.sock
# RUN chown -R mysql /var/run/mysqld

EXPOSE 3306

CMD tmp/start.sh