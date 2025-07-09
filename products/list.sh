#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

PRODUCT_NAME=${1:-"weather-provider"}
CATALOG_NAME=${2:-"Test"}
ORG_NAME=${3:-"IBM"}
SCOPE=${4:-"catalog"}

PRODUCT_NAME_SLUGIFIED=$(echo ${PRODUCT_NAME} | slugify)
CATALOG_NAME_SLUGIFIED=$(echo ${CATALOG_NAME} | slugify)
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

${APIC_CLI} products:list -s ${APIMGR_SERVER} -o ${ORG_NAME_SLUGIFIED} -c ${CATALOG_NAME_SLUGIFIED} --scope ${SCOPE} ${PRODUCT_NAME_SLUGIFIED}