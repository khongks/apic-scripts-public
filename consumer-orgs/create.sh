#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

CONSUMER_ORG_NAME=$1
CATALOG_NAME=$2
ORG_NAME=$3
OWNER_NAME=$4
CONFIGURED_USER_REGISTRY_NAME=$5

ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)
CATALOG_NAME_SLUGIFIED=$(echo ${CATALOG_NAME} | slugify)
CONSUMER_ORG_NAME_SLUGIFIED=$(echo ${CONSUMER_ORG_NAME} | slugify)

OWNER_URL=$(${DIR}/../users/get-url.sh ${OWNER_NAME} ${CONFIGURED_USER_REGISTRY_NAME} ${ORG_NAME_SLUGIFIED} ${APIMGR_SERVER})

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

${APIC_CLI} consumer-orgs:create -o ${ORG_NAME_SLUGIFIED} -c ${CATALOG_NAME_SLUGIFIED} -s ${APIMGR_SERVER} consumer-org.json --format json --output -
rm consumer-org.json