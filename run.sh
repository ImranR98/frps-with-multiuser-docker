#!/bin/bash

set -e

mkdir -p /workdir/service-data

if [ ! -f /workdir/service-data/frps.ini ]; then
    cp /workdir/default.frps.ini /workdir/service-data/frps.ini
fi

/usr/local/bin/frps -c /workdir/service-data/frps.ini &
/usr/local/bin/frps-multiuser -l 127.0.0.1:7200 -f /workdir/service-data/frps-tokens.txt &

wait -n