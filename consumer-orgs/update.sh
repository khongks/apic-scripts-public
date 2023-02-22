#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

CONSUMER_ORG_NAME=$1
CATALOG_NAME=$2
ORG_NAME=$3
CONFIGURED_USER_REGISTRY_NAME=$4

CONSUMER_ORG_NAME_SLUGIFIED=$(echo ${CONSUMER_ORG_NAME} | slugify)

## Note: The consumer organization owner can only be updated using the transfer owner operation.

cat > consumer-org.json <<EOF
{
    "type": "consumer_org",
    "api_version": "2.0.0",
    "name": "${CONSUMER_ORG_NAME_SLUGIFIED}",
    "title": "${CONSUMER_ORG_NAME}"
}
EOF
cat consumer-org.json

${APIC_CLI} consumer-orgs:update -o ${ORG_NAME} -c ${CATALOG_NAME} -s ${APIMGR_SERVER} ${CONSUMER_ORG_NAME} consumer-org.json --format json --output -
rm consumer-org.json