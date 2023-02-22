#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

CLIENT_ID=$1
CLIENT_SECRET=$2
CREDENTIAL_NAME=$3
APP_NAME=$4
CONSUMER_ORG_NAME=$5
CATALOG_NAME=$6
ORG_NAME=$7

cat > credential.json <<EOF
{
    "client_id": "${CLIENT_ID}",
    "client_secret": "${CLIENT_SECRET}"
}
EOF
# cat credential.json

${APIC_CLI} credentials:update -s ${APIMGR_SERVER} --org ${ORG_NAME} --catalog ${CATALOG_NAME} --consumer-org ${CONSUMER_ORG_NAME} --app ${APP_NAME} ${CREDENTIAL_NAME} credential.json --format json --output -
rm credential.json