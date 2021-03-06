FROM alpine:3.12

RUN apk update
RUN apk upgrade
RUN apk add vsftpd openrc vim openssl \
    telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN adduser -D user && echo "user:pass" | chpasswd

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout \
    /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=21School/CN=localhost"

COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./telegraf.conf /etc/telegraf/
COPY ./start.sh	/

EXPOSE 21 20 3000

CMD sh start.sh