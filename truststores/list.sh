#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

ORG_NAME=${1:-"IBM"}
SERVER_NAME=${2:-"${APIMGR_SERVER}"}

echo "${APIC_CLI} tls-client-profiles:list -s ${SERVER_NAME} -o ${ORG_NAME}"
${APIC_CLI} truststores:list -s ${SERVER_NAME} -o ${ORG_NAME}