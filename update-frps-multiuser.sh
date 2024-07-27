#!/bin/bash
FRPVER="$(curl -s https://api.github.com/repos/gofrp/fp-multiuser/releases/latest | grep -oE 'tag/.*' | grep -oE '[0-9]+(\.[0-9]+)*')"
if [ -z "$FRPVER" ]; then
    echo "Could not scrape frp-multiuser version." >&2
    exit 1
fi
RELNAME=fp-multiuser-linux-amd64
wget https://github.com/gofrp/fp-multiuser/releases/download/v"$FRPVER"/"$RELNAME"
chmod +x "$RELNAME"
mv "$RELNAME" /usr/local/bin/frps-multiuser