FROM alpine:edge

# Install required packages
RUN apk update
RUN apk upgrade
RUN apk add --no-cache git make gcc wget openssl-dev curl mosquitto-dev libc-dev curl-dev mosquitto=1.4.14-r5

EXPOSE 1883
EXPOSE 9001

CMD ["/usr/sbin/mosquitto", "-c", "/etc/mosquitto/mosquitto.conf"]
