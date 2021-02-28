#!/bin/bash
# Запуск сервисов
service nginx start
service mysql start
service php7.3-fpm start

# Инициализация database
db_name='wp_base'
username='admin'
password='admin'
hostname='localhost'

# wordpress database
service mysql start
mysql -e "CREATE DATABASE $db_name;"
mysql -e "CREATE USER '$username'@'localhost' IDENTIFIED BY '$password';"
# mysql  -e "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';"
mysql -e "GRANT ALL PRIVILEGES ON $db_name.* TO '$username'@'$hostname' WITH GRANT OPTION;"
mysql -e "UPDATE mysql.user SET plugin='mysql_native_password' WHERE user='$username';"
mysql -e "FLUSH PRIVILEGES;"

# phpmyadmin database
mysql < /var/www/server/phpmyadmin/sql/create_tables.sql

bash