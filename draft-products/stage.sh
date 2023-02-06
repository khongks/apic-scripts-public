#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

DRAFT_PRODUCT_FILE=$1
CATALOG_NAME=${2:-"Test"}
ORG_NAME=${3:-"IBM"}

${APIC_CLI} draft-products:publish --stage -o ${ORG_NAME} -c ${CATALOG_NAME} -s ${APIMGR_SERVER} ${DRAFT_PRODUCT_FILE}