FROM node:22-bookworm-slim

ARG T3_VERSION=0.1.2

RUN apt-get update \
  && apt-get install -y --no-install-recommends git ca-certificates curl libatomic1 \
  && rm -rf /var/lib/apt/lists/* \
  && npm install -g t3@${T3_VERSION}

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
COPY t3-pair /usr/local/bin/t3-pair

USER 1000:1000
WORKDIR /home/node/projects

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
