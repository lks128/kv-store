#!/usr/bin/env bash

# TODO: wait for postgres to be ready
# TODO: ideally I would wrap it into a Job kind

cat init.sql | \
    kubectl exec -i postgresql-0 --  bash -c 'PGPASSWORD=$POSTGRES_PASSWORD psql -U postgres'

export KV_STORE_PASSWORD=$(openssl rand -base64 16)

echo "alter user kv_store_user with password '$KV_STORE_PASSWORD';" | \
    kubectl exec -i postgresql-0 --  bash -c 'PGPASSWORD=$POSTGRES_PASSWORD psql -U postgres'

kubectl create secret generic postgresql-kvstore \
    --from-literal postgres-user=kv_store_user \
    --from-literal postgres-password=$KV_STORE_PASSWORD
