FRPVER="$(curl -s https://api.github.com/repos/fatedier/frp/releases/latest | grep -oE 'tag/.*' | grep -oE '[0-9]+(\.[0-9]+)*')"
MULTIVER="$(curl -s https://api.github.com/repos/gofrp/fp-multiuser/releases/latest | grep -oE 'tag/.*' | grep -oE '[0-9]+(\.[0-9]+)*')"

docker build . -t imranrdev/frps-with-multiuser
docker tag imranrdev/frps-with-multiuser:latest imranrdev/frps-with-multiuser:"$FRPVER"-"$MULTIVER"

# docker push --all-tags imranrdev/frps-with-multiuser