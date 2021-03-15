# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fngoc <fngoc@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/10 14:20:40 by fngoc             #+#    #+#              #
#    Updated: 2021/03/14 13:49:14 by fngoc            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Установка контейнерной OS
FROM alpine:3.12

# Установка и обновление образов
RUN apk update
RUN apk upgrade
RUN apk add supervisor influxdb && \
	apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# Копирование и предоставление прав
COPY ./supervisor.conf /etc/supervisord.conf
COPY ./telegraf.conf /etc/telegraf/
COPY ./start.sh /tmp/
RUN chmod +x tmp/start.sh

# Открытие волюма
VOLUME	["var/lib/influxdb"]

# Открытие портов
EXPOSE 8086

# Запуск
CMD tmp/start.sh