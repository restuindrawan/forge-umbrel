FROM node:22-bookworm-slim

ARG T3_VERSION=0.1.2

RUN apt-get update \
  && apt-get install -y --no-install-recommends git ca-certificates curl libatomic1 \
  && rm -rf /var/lib/apt/lists/* \
  && npm install -g t3@${T3_VERSION}

USER 1000:1000
WORKDIR /home/node/projects

ENTRYPOINT ["t3", "serve", "--mode", "web", "--host", "0.0.0.0", "--port", "3773", "--no-browser"]
