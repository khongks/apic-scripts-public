#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

ORG_NAME=${1:-"IBM"}
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)


${APIC_CLI} draft-products:list-all -o ${ORG_NAME_SLUGIFIED} -s ${APIMGR_SERVER}