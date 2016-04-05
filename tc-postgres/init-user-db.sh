#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE ROLE teamcity WITH LOGIN PASSWORD 'teamcity';
    CREATE DATABASE teamcity OWNER teamcity;
EOSQL