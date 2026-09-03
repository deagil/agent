#!/usr/bin/env bash
# Per-boot startup for Agent C Cloud Agents: bring up PostgreSQL and return.
# The Next.js + Eve dev server runs as a terminal (see environment.json).
set -euo pipefail

echo "==> Starting PostgreSQL"
pg_ctlcluster 16 main start 2>/dev/null || true
for _ in $(seq 1 30); do
  if pg_isready -h 127.0.0.1 -p 5432 >/dev/null 2>&1; then
    echo "==> PostgreSQL is ready"
    exit 0
  fi
  sleep 1
done

echo "PostgreSQL did not become ready on 127.0.0.1:5432" >&2
exit 1
