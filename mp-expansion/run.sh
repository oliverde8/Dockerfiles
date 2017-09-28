#!/bin/bash

echo "Preparing environment variables if not set"

if [ -z "$DATABASE_HOST" ]; then
    export DATABASE_HOST="mysql"
fi
if [ -z "$DATABASE_PORT" ]; then
    export DATABASE_PORT="3306"
fi
if [ -z "$DATABASE_NAME" ]; then
    export DATABASE_NAME="expansion"
fi
if [ -z "$DATABASE_USER" ]; then
    export DATABASE_USER="root"
fi
if [ -z "$DATABASE_PASSWORD" ]; then
    export DATABASE_PASSWORD=""
fi
if [ -z "$DEDI_HOST" ]; then
    export DEDI_HOST="dedicated"
fi
if [ -z "$DEDI_PORT" ]; then
    export DEDI_PORT="5000"
fi
if [ -z "$DEDI_PASSWORD" ]; then
    export DEDI_PASSWORD="SuperAdmin"
fi

echo "=> Going to for: ${DEDI_HOST}:${DEDI_PORT} with user SuperAdmin"

echo "Updating database schema"
bin/console doctrine:schema:update --dump-sql --force

#
# MP dedicated may take some time to start.
#
echo "Waiting a 30 sec for dedicated to start ..."
sleep 30s

echo "Starting eXpansion..."
bin/console eXpansion:run --env=prod