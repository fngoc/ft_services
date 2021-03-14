# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fngoc <fngoc@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/10 16:42:14 by fngoc             #+#    #+#              #
#    Updated: 2021/03/11 16:15:51 by fngoc            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Установка контейнерной OS
FROM alpine:3.12

# Установка и обновление образов
RUN apk update
RUN apk upgrade
RUN apk add sudo openrc vim wget supervisor \
    telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# Установка grafana
RUN wget https://dl.grafana.com/oss/release/grafana-7.4.0.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.4.0.linux-amd64.tar.gz
RUN rm -rf grafana-7.4.0.linux-amd64.tar.gz

# Установка glibc
RUN apk --no-cache add ca-certificates wget
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk
RUN apk add glibc-2.28-r0.apk

# Копирование и предоставление прав
COPY ./supervisor.conf /etc/supervisord.conf
COPY ./grafana.db /grafana-7.4.0/data/grafana.db
COPY ./telegraf.conf /etc/telegraf/
COPY ./start.sh /tmp/
RUN ln -s grafana-7.4.0/bin/grafana-server ./grafana-server
RUN chmod +x tmp/start.sh

# Открытие портов
EXPOSE 3000

# Запуск
CMD tmp/start.sh