FROM alpine:edge

# Install required packages
RUN apk update
RUN apk upgrade
RUN apk add --no-cache git make gcc wget openssl-dev curl mosquitto-dev libc-dev curl-dev mosquitto=1.4.14-r5

# Download mosquitto sources
WORKDIR /usr/local
RUN wget http://mosquitto.org/files/source/mosquitto-1.4.14.tar.gz && tar -zxvf mosquitto-1.4.14.tar.gz
RUN rm mosquitto-1.4.14.tar.gz

# Download mosquitto auth plugin
RUN git clone https://github.com/jpmens/mosquitto-auth-plug.git /usr/local/mosquitto-auth

# Compile mosquitto auth plugin
COPY config.mk /usr/local/mosquitto-auth
WORKDIR /usr/local/mosquitto-auth
RUN make

EXPOSE 1883
EXPOSE 9001

CMD ["/usr/sbin/mosquitto", "-c", "/etc/mosquitto/mosquitto.conf"]
