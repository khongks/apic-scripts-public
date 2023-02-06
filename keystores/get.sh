#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

KEYSTORE_NAME=${1}
ORG_NAME=${2:-"IBM"}
SERVER_NAME=${3:-"${APIMGR_SERVER}"}

${APIC_CLI} keystores:get  -s ${SERVER_NAME} -o ${ORG_NAME} ${KEYSTORE_NAME} --format json --output -