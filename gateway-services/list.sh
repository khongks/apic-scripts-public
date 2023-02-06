#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

GATEWAY_SERVICE_NAME=${1:-"gateway-service"}
ORG_NAME=${2:-"IBM"}
SCOPE=${3:-"org"}

${APIC_CLI} gateway-services:list -s ${APIMGR_SERVER}  -o ${ORG_NAME} --scope ${SCOPE}