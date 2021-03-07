#!/bin/bash

telegraf &
php -S 0.0.0.0:5050 -t /usr/share/webapps/wordpress/