#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

GATEWAY_SERVICE_NAME=${1:-"gateway-service"}
CATALOG_NAME=${2:-Test}
ORG_NAME=${3:-IBM}

${APIC_CLI} configured-gateway-services:get --scope catalog -s ${APIMGR_SERVER} -o ${ORG_NAME} -c ${CATALOG_NAME} ${GATEWAY_SERVICE_NAME} --format json --output -