#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh
PRODUCT_FILE=${1}
CATALOG_NAME=${2:-"Test"}
ORG_NAME=${3:-"IBM"}
SCOPE=${4:-"catalog"}

CATALOG_NAME_SLUGIFIED=$(echo ${CATALOG_NAME} | slugify)
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

${APIC_CLI} products:publish --migrate_subscriptions -s ${APIMGR_SERVER} -o ${ORG_NAME_SLUGIFIED} -c ${CATALOG_NAME_SLUGIFIED} --scope ${SCOPE} ${PRODUCT_FILE}