#!/bin/sh
if [ ! -f /etc/bind/named.conf ]; then
    mkdir -p /var/cache/bind
    chown -R named /var/cache/bind
    cp -a etc_bind/* /etc/bind
fi

named -c /etc/bind/named.conf -g -u named