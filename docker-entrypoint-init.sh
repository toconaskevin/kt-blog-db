#!/bin/sh
set -eu

# If INIT_SQL_DIR points to a directory (e.g. Cloud Run bucket mount at /mnt/seed), copy *.sql
# into docker-entrypoint-initdb.d in sorted order. Otherwise use SQL baked into the image.
#
# Cloud Run: mount bucket with gen2 + volume, then set INIT_SQL_DIR to the mount path.
# https://cloud.google.com/run/docs/configuring/services/cloud-storage-volume-mounts

ORIG_ENTRYPOINT="/usr/local/bin/docker-entrypoint.sh"

if [ -n "${INIT_SQL_DIR:-}" ] && [ -d "$INIT_SQL_DIR" ] && ls "$INIT_SQL_DIR"/*.sql >/dev/null 2>&1; then
  echo "docker-entrypoint-init: loading init SQL from ${INIT_SQL_DIR}"
  rm -rf /docker-entrypoint-initdb.d
  mkdir -p /docker-entrypoint-initdb.d
  idx=0
  for f in $(ls -1 "$INIT_SQL_DIR"/*.sql 2>/dev/null | LC_ALL=C sort); do
    [ -f "$f" ] || continue
    idx=$((idx + 1))
    cp -L "$f" "/docker-entrypoint-initdb.d/$(printf '%02d-%s' "$idx" "$(basename "$f")")"
  done
fi

exec "$ORIG_ENTRYPOINT" "$@"
