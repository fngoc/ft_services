# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fngoc <fngoc@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/22 20:35:01 by fngoc             #+#    #+#              #
#    Updated: 2021/02/22 20:35:55 by fngoc            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Установка контейнерной OS
FROM alpine:3.12

RUN apk update
RUN apk upgrade
RUN apk add nginx openssl openssh supervisor openrc bash

RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./supervisor.conf /etc/supervisord.conf

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