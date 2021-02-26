#!/bin/sh

ssh-keygen -A

/usr/bin/supervisord -c /etc/supervisord.conf

# nginx -g 'daemon off;'