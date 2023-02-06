#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

DRAFT_PRODUCT_FILE=$1
ORG_NAME=${2:-"IBM"}

${APIC_CLI} draft-apis:create -o ${ORG_NAME} -s ${APIMGR_SERVER} ${DRAFT_PRODUCT_FILE}