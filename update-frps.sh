#!/bin/bash
FRPVER="$(curl -s https://api.github.com/repos/fatedier/frp/releases/latest | grep -oE 'tag/.*' | grep -oE '[0-9]+(\.[0-9]+)*')"
if [ -z "$FRPVER" ]; then
    echo "Could not scrape frp version." >&2
    exit 1
fi
RELNAME=frp_"$FRPVER"_linux_amd64
wget https://github.com/fatedier/frp/releases/download/v"$FRPVER"/"$RELNAME".tar.gz
tar -xvf "$RELNAME".tar.gz
mv "$RELNAME"/frps /usr/local/bin/frps
rm "$RELNAME".tar.gz
rm -r "$RELNAME"
