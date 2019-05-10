#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# env
export BRIDGE_PORT=8000
export COMPLIANCE_EXTERNAL_PORT=80
export COMPLIANCE_INTERNAL_PORT=8002
export FI_PORT=8003

function config_all() {
  export DATABASE_URL=postgres://postgres@db/bridge?sslmode=disable
  sed -i "s#{DATABASE_URL}#${DATABASE_URL}#g" bridge.cfg
  sed -i "s/{BRIDGE_PORT}/${BRIDGE_PORT}/g" bridge.cfg
  sed -i "s/{ISSUING_ACCOUNT}/${ISSUING_ACCOUNT}/g" bridge.cfg
  sed -i "s/{RECEIVING_ACCOUNT}/${RECEIVING_ACCOUNT}/g" bridge.cfg
  sed -i "s/{RECEIVING_SEED}/${RECEIVING_SEED}/g" bridge.cfg
  sed -i "s/{AUTHORIZING_SEED}/${AUTHORIZING_SEED}/g" bridge.cfg
  sed -i "s/{COMPLIANCE_INTERNAL_PORT}/${COMPLIANCE_INTERNAL_PORT}/g" bridge.cfg
  sed -i "s/{FI_PORT}/${FI_PORT}/g" bridge.cfg

  export DATABASE_URL=postgres://postgres@db/compliance?sslmode=disable
  sed -i "s#{DATABASE_URL}#${DATABASE_URL}#g" compliance.cfg
  sed -i "s/{COMPLIANCE_EXTERNAL_PORT}/${COMPLIANCE_EXTERNAL_PORT}/g" compliance.cfg
  sed -i "s/{COMPLIANCE_INTERNAL_PORT}/${COMPLIANCE_INTERNAL_PORT}/g" compliance.cfg
  sed -i "s/{SIGNING_SEED}/${SIGNING_SEED}/g" compliance.cfg
  sed -i "s/{FI_PORT}/${FI_PORT}/g" compliance.cfg
}

function init_all() {
  # Wait for postgres to start
  until psql -h db -U postgres -c '\l'; do
    echo "Waiting for postgres..."
    sleep 5
  done

  # Drop databases when starting existing machine
  psql -h db -c 'drop database bridge;' -U postgres || true
  psql -h db -c 'drop database compliance;' -U postgres || true
  psql -h db -c 'create database bridge;' -U postgres
  psql -h db -c 'create database compliance;' -U postgres

  # Migrate DB for Stellar services
  ./bridge --migrate-db
  ./compliance --migrate-db
}

function start () {

  # Modify /etc/hosts, tart the Stellar services
  echo $VM_IP_ADDRESS $FI_DOMAIN >> /etc/hosts
  echo $VM_IP_ADDRESS $OTHER_FI_DOMAIN >> /etc/hosts
  cat /etc/hosts
  ./bridge -c bridge.cfg &
  ./compliance -c compliance.cfg &

  # Wait for the Stellar services to start, then start node
  sleep 5
  /bin/versions/node/v6.17.1/bin/node fisc
}

if [ ! -f _created ]
then
  config_all
  init_all
  touch _created
fi
start
