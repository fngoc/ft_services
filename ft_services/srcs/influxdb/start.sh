#!/bin/sh

/usr/bin/supervisord -c /etc/supervisord.conf

influx -execute "CREATE DATABASE telegraf"
influx -execute "CREATE USER telegraf WITH PASSWORD 'telegraf'"