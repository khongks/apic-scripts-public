#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

CLIENT_ID=${1:-"a3e9ada8c4c8bb8e79ebee49c13a183d"}
CLIENT_SECRET=${2:-"56aaec2b238f01aa59e169de721afd0a"}
CREDENTIAL_NAME=${3:-"Credential-for-My-Sample-App-1"}
APP_NAME=${4:-"my-sample-app"}
CONSUMER_ORG_NAME=${5:-"def"}
CATALOG_NAME=${6:-"Test"}
ORG_NAME=${7:-"IBM"}

cat > credential.json <<EOF
{
    "name": "${CREDENTIAL_NAME}",
    "client_id": "${CLIENT_ID}",
    "client_secret": "${CLIENT_SECRET}"
}
EOF
cat credential.json

${APIC_CLI} credentials:create -s ${APIMGR_SERVER} --org ${ORG_NAME} --catalog ${CATALOG_NAME} --consumer-org ${CONSUMER_ORG_NAME} --app ${APP_NAME} credential.json --format json --output -