#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

PRODUCT_FILE=${1}
CATALOG_NAME=${2:-"Test"}
ORG_NAME=${3:-"IBM"}
SCOPE=${4:-"catalog"}

echo "${APIC_CLI} products:publish -s ${APIMGR_SERVER} -o ${ORG_NAME} -c ${CATALOG_NAME} --scope ${SCOPE} ${PRODUCT_FILE}"
${APIC_CLI} products:publish --migrate_subscriptions -s ${APIMGR_SERVER} -o ${ORG_NAME} -c ${CATALOG_NAME} --scope ${SCOPE} ${PRODUCT_FILE}