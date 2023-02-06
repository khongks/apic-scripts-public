#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

CATALOG_NAME=${1:-Test}
ORG_NAME=${2:-IBM}

${APIC_CLI} configured-gateway-services:list -c ${CATALOG_NAME} --scope catalog -s ${APIMGR_SERVER} -o ${ORG_NAME}