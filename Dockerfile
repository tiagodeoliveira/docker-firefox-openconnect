FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y libglu1 firefox openconnect inetutils-ping
RUN mkdir -p /etc/openconnect && touch /etc/openconnect/openconnect.conf

CMD ["/usr/bin/firefox"]
