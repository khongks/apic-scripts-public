#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

DRAFT_PRODUCT_FILE=$1
PRODUCT_NAME=$2
ORG_NAME=${3:-"IBM"}

PRODUCT_NAME_SLUGIFIED=$(echo ${PRODUCT_NAME} | slugify)
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

${APIC_CLI} draft-apis:update -o ${ORG_NAME_SLUGIFIED} -s ${APIMGR_SERVER} ${PRODUCT_NAME_SLUGIFIED} ${DRAFT_PRODUCT_FILE}