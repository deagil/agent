# Cloud Agent base image for Agent C.
# Provides the stable system toolchain the repo needs:
#   - Node.js 24 (package.json engines: >=24) with corepack (pnpm 11)
#   - PostgreSQL 16 + pgvector for the local development database
# Repository dependencies (pnpm install) and DB migrations run in install.sh
# after the source tree is checked out.
FROM node:24-bookworm

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        git \
        curl \
        ca-certificates \
        sudo \
        postgresql \
        postgresql-contrib \
        postgresql-16-pgvector \
    && rm -rf /var/lib/apt/lists/* \
    && corepack enable
