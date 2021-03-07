#!/bin/sh

ssh-keygen -A

telegraf &
/usr/bin/supervisord -c /etc/supervisord.conf