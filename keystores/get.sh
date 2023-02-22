#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

KEYSTORE_NAME=${1}
ORG_NAME=${2:-"IBM"}
SERVER_NAME=${3:-"${APIMGR_SERVER}"}

KEYSTORE_NAME_SLUGIFIED="$(echo ${KEYSTORE_NAME} | slugify)"

# echo "${APIC_CLI} keystores:get  -s ${SERVER_NAME} -o ${ORG_NAME} ${KEYSTORE_NAME_SLUGIFIED} --format json --output -"
${APIC_CLI} keystores:get  -s ${SERVER_NAME} -o ${ORG_NAME} ${KEYSTORE_NAME_SLUGIFIED} --format json --output -