#!/bin/sh
set -eu

PORT="${T3CODE_PORT:-3773}"
PAIR_TTL="${T3_PAIR_TTL:-1h}"

t3 serve --mode web --host 0.0.0.0 --port "$PORT" --no-browser "$@" &
SERVER_PID=$!
trap 'kill -TERM "$SERVER_PID" 2>/dev/null || true' TERM INT

# The first start downloads the T3 runtime, so give it a few minutes.
i=0
until curl -fs "http://127.0.0.1:${PORT}/.well-known/t3/environment" >/dev/null 2>&1; do
  i=$((i + 1))
  if [ "$i" -gt 300 ] || ! kill -0 "$SERVER_PID" 2>/dev/null; then
    wait "$SERVER_PID"
    exit $?
  fi
  sleep 2
done

t3-pair "$PAIR_TTL" || true

wait "$SERVER_PID"
