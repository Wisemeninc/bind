FROM ubuntu:24.04

LABEL maintainer="andrey.mikhalchuk@conceptant.com"
LABEL version="0.0.1.1"
LABEL description="This Dockerfile builds BIND9"
LABEL "com.conceptant.vendor"="Conceptant, Inc."

COPY files .

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        bind9 \
        vim \
        dnsutils \
    && chmod +x entrypoint.sh

VOLUME /var/cache/bind /etc/bind

EXPOSE 53/tcp 53/udp

CMD ["/entrypoint.sh"]