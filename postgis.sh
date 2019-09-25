#!/bin/sh

for DB in $(psql -t -c  "SELECT datname from pg_database where datname = 'database'"); do
    echo "Loading PostGIS extensions into $DB"
    "${psql[@]}" --dbname="$DB" <<-'EOSQL'
        CREATE EXTENSION IF NOT EXISTS postgis;
EOSQL
done
