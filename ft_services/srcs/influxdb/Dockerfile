FROM alpine:3.12

RUN apk update
RUN apk upgrade
RUN apk add sudo openrc vim wget influxdb \
    telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY ./telegraf.conf /etc/telegraf/
COPY ./start.sh /tmp/
RUN chmod +x tmp/start.sh

EXPOSE 8086

CMD tmp/start.sh