FROM openjdk:11
MAINTAINER LolHens <pierrekisters@gmail.com>


ENV SCALA_VERSION 2.13
ENV AMM_VERSION 2.2.0
ENV AMM_FILE $SCALA_VERSION-$AMM_VERSION
ENV AMM_URL https://github.com/lihaoyi/Ammonite/releases/download/$AMM_VERSION/$AMM_FILE


RUN apt-get update \
 && apt-get install -y \
      ca-certificates \
      curl \
 && (echo '#!/usr/bin/env sh' && curl -L "$AMM_URL") > /usr/local/bin/amm \
 && chmod +x "/usr/local/bin/amm" \
 && mkdir -p ~/.ammonite

RUN amm -c ""

COPY ["entrypoint", "/entrypoint"]
ENTRYPOINT /entrypoint
CMD amm
