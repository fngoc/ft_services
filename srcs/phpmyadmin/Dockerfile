# Установка контейнерной OS
FROM alpine:3.12

# Установка и обновление образов
RUN	apk add wget php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session nginx supervisor \
	lighttpd php7-common php7-iconv php7-gd php7-curl php7-xml php7-imap php7-cgi \
	fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix \
	php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom \
	telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# Установка phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar -xzvf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN rm -rf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mkdir -p /www /etc/telegraf
RUN mv phpMyAdmin-5.0.4-all-languages /www/phpmyadmin

# Копирование
COPY ./telegraf.conf /etc/telegraf/
COPY ./supervisor.conf /etc/supervisord.conf
COPY ./config.inc.php /www/phpmyadmin/
RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /run/nginx
RUN mkdir -p /var/run/php
COPY ./start.sh	/

# Открытие портов
EXPOSE	5000

# Запуск
CMD sh start.sh