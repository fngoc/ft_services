# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fngoc <fngoc@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/10 18:10:27 by fngoc             #+#    #+#              #
#    Updated: 2021/03/10 19:44:17 by fngoc            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Установка контейнерной OS
FROM alpine:3.12

# Установка и обновление образов
RUN apk update
RUN apk upgrade
RUN apk add sudo vsftpd openrc vim openssl supervisor \
    telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# Создание пользователя
RUN adduser -D user && echo "user:pass" | chpasswd

# Установка ssl
RUN openssl req -x509 -nodes -days 10 -subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=21School/CN=localhost" \
    -newkey rsa:1024 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem

# Копирование и предоставление прав
RUN mkdir -p home/user/
RUN sudo chmod -R 755 home/user/
RUN sudo chmod -R 755 /etc/ssl/private/pure-ftpd.pem
COPY ./supervisor.conf /etc/supervisord.conf
COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./telegraf.conf /etc/telegraf/
COPY ./start.sh	/

# Открытие портов
EXPOSE 21 20 20020

# Запуск
CMD sh start.sh