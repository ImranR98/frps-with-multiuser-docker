FROM ubuntu
RUN apt update -yq && apt upgrade -yq && apt autoremove -yq
RUN apt install -yq curl wget

WORKDIR /workdir

COPY . .

ARG CACHEBUST=1 

RUN bash update-frps.sh
RUN bash update-frps-multiuser.sh

ENTRYPOINT ["/usr/bin/bash", "/workdir/run.sh"]