#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

PRODUCT_NAME=$1
ORG_NAME=${2:-"IBM"}

${APIC_CLI} draft-products:list -o ${ORG_NAME} -s ${APIMGR_SERVER} ${PRODUCT_NAME}