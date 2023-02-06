#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

GATEWAY_SERVICE_NAME=${1:-"gateway-service"}
AVAILABILITY_ZONE=${2:-"availability-zone-default"}
ORG_NAME=${3:-"IBM"}
SCOPE=${4:-"org"}

# echo "${APIC_CLI} gateway-services:get --server ${APIMGR_SERVER} -o ${ORG_NAME} --scope ${SCOPE} --format json --output - ${NAME}"
${APIC_CLI} gateway-services:get --server ${APIMGR_SERVER} -o ${ORG_NAME} --scope ${SCOPE} --format json --output - ${GATEWAY_SERVICE_NAME}