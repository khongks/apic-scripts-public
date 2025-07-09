#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

PRODUCT_NAME=$1
ORG_NAME=${2:-"IBM"}

PRODUCT_NAME_SLUGIFIED=$(echo ${PRODUCT_NAME} | slugify)
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

${APIC_CLI} draft-apis:list -o ${ORG_NAME_SLUGIFIED} -s ${APIMGR_SERVER} ${PRODUCT_NAME_SLUGIFIED}