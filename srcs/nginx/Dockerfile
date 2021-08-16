# Установка контейнерной OS
FROM alpine:3.12

# Установка и обновление образов
RUN apk update
RUN apk upgrade
RUN apk add nginx openssl openssh supervisor openrc bash vim \
    telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# Копирование
RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./supervisor.conf /etc/supervisord.conf
COPY ./telegraf.conf /etc/telegraf/
COPY ./index.html /www/index.html

# Устанавливаем ssh и пользователя
RUN ssh-keygen -A && adduser -D user && echo "user:pass" | chpasswd

# Устанавливаем ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout \
/etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
-subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=21School/CN=localhost"

# Открытие портов
EXPOSE 80 443 22

# Запуск
COPY ./start.sh /tmp/
RUN chmod +x tmp/start.sh
RUN mkdir -p /run/nginx
CMD tmp/start.sh