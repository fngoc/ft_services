#!/bin/sh

telegraf &
cd ./grafana-7.4.0/bin/ && ./grafana-server