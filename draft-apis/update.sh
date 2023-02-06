#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

PRODUCT_NAME=$1
DRAFT_PRODUCT_FILE=$2
ORG_NAME=${3:-"IBM"}

${APIC_CLI} draft-apis:update -o ${ORG_NAME} -s ${APIMGR_SERVER} ${PRODUCT_NAME} ${DRAFT_PRODUCT_FILE}