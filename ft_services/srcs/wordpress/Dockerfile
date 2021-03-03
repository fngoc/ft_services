# Установка контейнерной OS
FROM alpine:3.12

# Установка и обновление образов
RUN apk update
RUN apk upgrade
RUN apk add wget \
            nginx \
            php-fpm \
            php-pdo \
            php-gd \
            php-cli \
            php-mbstring \
            php-zip \
            php-xmlrpc \
            php-xml \
            php-soap \
            php-intl

# Установка wordpress
WORKDIR /var/www/server
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN rm -rf latest.tar.gz
WORKDIR /var/www/server/wordpress
COPY ./wp-config.php .

COPY ./start.sh ./
RUN chmod +x start.sh

# Открытие портов
EXPOSE 5050

# Выполняем команду во время запуска контейнера
CMD sh ./start.sh