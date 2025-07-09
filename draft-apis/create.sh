#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

DRAFT_PRODUCT_FILE=$1
ORG_NAME=${2:-"IBM"}

ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

${APIC_CLI} draft-apis:create -o ${ORG_NAME_SLUGIFIED} -s ${APIMGR_SERVER} ${DRAFT_PRODUCT_FILE}