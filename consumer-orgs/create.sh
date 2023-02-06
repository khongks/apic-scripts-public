#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

CONSUMER_ORG_NAME=${1:-"DEF"}
CATALOG_NAME=${2:-"Test"}
ORG_NAME=${3:-"IBM"}
OWNER_NAME=${4:-"nigel"}
CONFIGURED_LUR_NAME=${5:-"Test-catalog-0"}

OWNER_URL=$(${DIR}/../users/get.sh ${OWNER_NAME} ${CONFIGURED_LUR_NAME} ${ORG_NAME} | jq -r .url)

cat > consumer-org.json <<EOF
{
    "type": "consumer_org",
    "api_version": "2.0.0",
    "name": "$(echo ${CONSUMER_ORG_NAME} | slugify)",
    "title": "${CONSUMER_ORG_NAME}",
    "owner_url": "${OWNER_URL}"
}
EOF
cat consumer-org.json

${APIC_CLI} consumer-orgs:create -o ${ORG_NAME} -c ${CATALOG_NAME} -s ${APIMGR_SERVER} consumer-org.json --format json --output -
rm consumer-org.json