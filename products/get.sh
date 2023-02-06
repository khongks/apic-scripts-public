#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

PRODUCT_NAME=${1:-"weather-provider:1.0.0"}
CATALOG_NAME=${2:-"Test"}
ORG_NAME=${3:-"IBM"}
SCOPE=${4:-"catalog"}

# echo "${APIC_CLI} products:get -s ${APIMGR_SERVER} -o ${ORG_NAME} -c ${CATALOG_NAME} --scope ${SCOPE} ${PRODUCT_NAME}"
${APIC_CLI} products:get -s ${APIMGR_SERVER} -o ${ORG_NAME} -c ${CATALOG_NAME} --scope ${SCOPE} ${PRODUCT_NAME}