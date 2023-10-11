FROM bitnami/postgresql:15

COPY sql/*.sql /docker-entrypoint-initdb.d/
