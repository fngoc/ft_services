#!/bin/sh

ssh-keygen -A

/usr/sbin/sshd -D

telegraf &
php -S 0.0.0.0:5000 -t /www/phpmyadmin