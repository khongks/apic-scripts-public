#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

ORG_NAME=$1
SERVER_NAME=$2

echo "${APIC_CLI} tls-client-profiles:clear-all -s ${SERVER_NAME} -o ${ORG_NAME}"
${APIC_CLI} tls-client-profiles:clear-all -s ${SERVER_NAME} -o ${ORG_NAME} --confirm ${ORG_NAME}