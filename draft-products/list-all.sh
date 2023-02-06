#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

ORG_NAME=${1:-"IBM"}

${APIC_CLI} draft-products:list-all -o ${ORG_NAME} -s ${APIMGR_SERVER}