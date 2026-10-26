FROM node:22-bookworm-slim

ARG T3_VERSION=0.1.2
ARG CLAUDE_CODE_VERSION=2.1.310
ARG CODEX_VERSION=0.164.0
ARG OPENCODE_VERSION=2.1.4

RUN apt-get update \
  && apt-get install -y --no-install-recommends git ca-certificates curl libatomic1 openssh-client ripgrep procps \
  && rm -rf /var/lib/apt/lists/* \
  && npm install -g \
    t3@${T3_VERSION} \
    @anthropic-ai/claude-code@${CLAUDE_CODE_VERSION} \
    @openai/codex@${CODEX_VERSION} \
    @opencode/cli@${OPENCODE_VERSION} \
  && npm cache clean --force

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
COPY t3-pair /usr/local/bin/t3-pair

USER 1000:1000
WORKDIR /home/node/projects

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
