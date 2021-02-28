# Установка контейнерной OS
FROM alpine:3.12

# Установка и обновление образов
RUN apk update
RUN apk upgrade
RUN apk add bash vim wget \
                    mariadb-server \
                    php7.3 \
                    php-mysql \
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
RUN chown -R www-data:www-data /var/www/server/wordpress
WORKDIR /var/www/server/wordpress
COPY ./wp-config.php .

# Установка php-myadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar -xzvf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN rm -rf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.4-all-languages/ /var/www/server/phpmyadmin
COPY ./config.inc.php /var/www/server/phpmyadmin

# Копирование start.sh
COPY ./start.sh ./

# Открываем порты
EXPOSE 5050

# Выполняем команду во время запуска контейнера
CMD sh ./start.sh