#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

DRAFT_PRODUCT_FILE=$1
CATALOG_NAME=${2:-"Test"}
ORG_NAME=${3:-"IBM"}

CATALOG_NAME_SLUGIFIED=$(echo ${CATALOG_NAME} | slugify)
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

${APIC_CLI} draft-products:publish -o ${ORG_NAME_SLUGIFIED} -c ${CATALOG_NAME_SLUGIFIED} -s ${APIMGR_SERVER} ${DRAFT_PRODUCT_FILE}