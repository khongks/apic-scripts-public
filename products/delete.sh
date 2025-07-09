#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

PRODUCT_NAME=${1:-"weather-provider"}
PRODUCT_VERSION=${2:-"2.0.0"}
CATALOG_NAME=${3:-"Test"}
ORG_NAME=${4:-"IBM"}
SCOPE=${5:-"catalog"}

PRODUCT_NAME_SLUGIFIED=$(echo ${PRODUCT_NAME} | slugify)
CATALOG_NAME_SLUGIFIED=$(echo ${CATALOG_NAME} | slugify)
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

# echo "${APIC_CLI} products:delete -s ${APIMGR_SERVER} -o ${ORG_NAME_SLUGIFIED} -c ${CATALOG_NAME_SLUGIFIED} --scope ${SCOPE} ${PRODUCT_NAME_SLUGIFIED}:${PRODUCT_VERSION}"
${APIC_CLI} products:delete -s ${APIMGR_SERVER} -o ${ORG_NAME_SLUGIFIED} -c ${CATALOG_NAME_SLUGIFIED} --scope ${SCOPE} ${PRODUCT_NAME_SLUGIFIED}:${PRODUCT_VERSION}