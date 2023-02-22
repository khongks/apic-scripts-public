#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

CONSUMER_ORG_NAME=$1
CATALOG_NAME=$2
ORG_NAME=$3
OWNER_NAME=$4
CONFIGURED_USER_REGISTRY_NAME=$5

CONSUMER_ORG_NAME_SLUGIFIED=$(echo ${CONSUMER_ORG_NAME} | slugify)

OWNER_URL=$(${DIR}/../users/get-url.sh ${OWNER_NAME} ${CONFIGURED_USER_REGISTRY_NAME} ${ORG_NAME} ${APIMGR_SERVER})

cat > consumer-org.json <<EOF
{
    "type": "consumer_org",
    "api_version": "2.0.0",
    "name": "${CONSUMER_ORG_NAME_SLUGIFIED}",
    "title": "${CONSUMER_ORG_NAME}",
    "owner_url": "${OWNER_URL}"
}
EOF
cat consumer-org.json

${APIC_CLI} consumer-orgs:create -o ${ORG_NAME} -c ${CATALOG_NAME} -s ${APIMGR_SERVER} consumer-org.json --format json --output -
rm consumer-org.json