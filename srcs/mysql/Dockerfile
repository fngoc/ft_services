# Установка контейнерной OS
FROM alpine:3.12

# Установка и обновление образов
RUN apk update
RUN apk upgrade
RUN apk add sudo vim mysql mysql-client supervisor \
    openrc mariadb mariadb-common mariadb-client \
    telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# Копирование и предоставление прав
RUN mkdir -p /run/mysqld/
COPY ./telegraf.conf /etc/telegraf/
COPY ./supervisor.conf /etc/supervisord.conf
COPY ./wordpress.sql /
COPY ./my.cnf /etc/
COPY ./start.sh /tmp/
RUN sudo chmod -R 755 /var/lib/mysql/
RUN chmod +x tmp/start.sh

# Открытие волюма
VOLUME ["/var/lib/mysql"]

# Открытие портов
EXPOSE 3306

# Запуск
CMD tmp/start.sh