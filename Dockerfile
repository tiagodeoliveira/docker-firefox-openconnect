FROM ubuntu:xenial

RUN apt-get update
RUN apt-get install -y libglu1 firefox openconnect
RUN mkdir -p /etc/openconnect && touch /etc/openconnect/openconnect.conf

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
