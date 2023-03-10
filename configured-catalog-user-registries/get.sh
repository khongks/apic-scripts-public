#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

CONFIGURED_LUR_NAME=${1:-"Test-catalog-0"}
CATALOG_NAME=${2:-"Test"}
ORG_NAME=${3:-"IBM"}
SERVER_NAME=$4

${APIC_CLI} configured-catalog-user-registries:get -o ${ORG_NAME} -c ${CATALOG_NAME} -s ${SERVER_NAME} ${CONFIGURED_LUR_NAME} --format json --output -