# ========================================
# Custom PostgreSQL Image for Java UMS App
# ========================================
FROM postgres:16-alpine

# Set environment variables (can be overridden at runtime)
ENV POSTGRES_USER=dbadmin \
    POSTGRES_PASSWORD=Admin@123 \
    POSTGRES_DB=umsdb \
    TZ=UTC

# Copy initialization SQL scripts
# Everything in /docker-entrypoint-initdb.d/ is auto-run on first DB startup
COPY init/*.sql /docker-entrypoint-initdb.d/

# (Optional) Override PostgreSQL configs for remote access, etc.
# Uncomment these lines if you want to include your own configs
COPY config/postgresql.conf /var/lib/pgsql/data/postgresql.conf
COPY config/pg_hba.conf /var/lib/pgsql/data/pg_hba.conf

# Expose the DB port
EXPOSE 5432

# Add healthcheck for Kubernetes readiness
HEALTHCHECK --interval=30s --timeout=5s --start-period=15s CMD pg_isready -U $POSTGRES_USER -d $POSTGRES_DB || exit 1
