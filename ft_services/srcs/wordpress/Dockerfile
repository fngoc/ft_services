# Установка контейнерной OS
FROM alpine:3.12

# Установка и обновление образов
RUN apk update
RUN apk upgrade
RUN apk add wget nginx lighttpd php7-common php7-iconv php7-json \
    php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi \
    php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt \
    php7-gettext php7-ldap php7-ctype php7-dom \
    telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# Установка nginx
RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# Установка wordpress
RUN mkdir -p /usr/share/webapps/
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN rm -rf latest.tar.gz
RUN chown -R lighttpd /usr/share/webapps/
RUN ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress

COPY ./wp-config.php .
COPY ./start.sh ./
RUN chmod +x start.sh

# Открытие портов
EXPOSE 5050

# Выполняем команду во время запуска контейнера
CMD sh ./start.sh