FROM alpine:3.12

RUN apk update
RUN apk upgrade 
RUN apk add openrc --no-cache && \
	apk add influxdb && \
	apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
	openrc && touch /run/openrc/softlevel && \
	rc-update add telegraf

COPY ./telegraf.conf /etc/telegraf/
COPY ./start.sh /tmp/
RUN chmod +x tmp/start.sh

EXPOSE 8086

CMD tmp/start.sh