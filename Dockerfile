FROM lolhens/baseimage-openjre:latest
MAINTAINER LolHens <pierrekisters@gmail.com>


ENV SCALA_VERSION 2.13
ENV AMM_VERSION 1.7.1
ENV AMM_FILE $SCALA_VERSION-$AMM_VERSION
ENV AMM_URL https://github.com/lihaoyi/Ammonite/releases/download/$AMM_VERSION/$AMM_FILE


RUN (echo '#!/usr/bin/env sh' && curl -L "$AMM_URL") > /usr/local/bin/amm \
 && chmod +x "/usr/local/bin/amm"

RUN amm -c ""


CMD amm
