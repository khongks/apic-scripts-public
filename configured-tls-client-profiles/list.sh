#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

PROFILE_NAME=$1
ORG_NAME=${2:-"IBM"}
SERVER_NAME=${3:-"${APIMGR_SERVER}"}

echo "${APIC_CLI} configured-tls-client-profiles:list -s ${SERVER_NAME} -o ${ORG_NAME} ${PROFILE_NAME}"
${APIC_CLI} configured-tls-client-profiles:list -s ${SERVER_NAME} -o ${ORG_NAME} ${PROFILE_NAME}