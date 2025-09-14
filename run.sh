#!/bin/bash

set -e

mkdir -p /workdir/service-data

if [ ! -f /workdir/service-data/frps.toml ]; then
    cp /workdir/default.frps.toml /workdir/service-data/frps.toml
fi

/usr/local/bin/frps -c /workdir/service-data/frps.toml &
/usr/local/bin/frps-multiuser -l 127.0.0.1:7200 -f /workdir/service-data/frps-tokens.txt &

wait -n