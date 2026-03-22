FROM postgres:16-alpine

COPY docker-entrypoint-init.sh /usr/local/bin/docker-entrypoint-init.sh
RUN chmod +x /usr/local/bin/docker-entrypoint-init.sh

# Default init when INIT_SQL_DIR is unset (local Compose). For Cloud Run + GCS volume: set
# INIT_SQL_DIR to the bucket mount path and put 01-schema.sql, 02-seed.sql (etc.) in the bucket.
COPY ./init/ /docker-entrypoint-initdb.d/

# POSTGRES_DB, POSTGRES_USER, POSTGRES_PASSWORD — Cloud Run / Compose.
# Optional: INIT_SQL_DIR — directory of *.sql (e.g. Cloud Storage volume mount).

ENTRYPOINT ["/usr/local/bin/docker-entrypoint-init.sh"]

EXPOSE 5432

CMD ["postgres"]
