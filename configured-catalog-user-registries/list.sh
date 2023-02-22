#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

CATALOG_NAME=${1:-"Test"}
ORG_NAME=${2:-"IBM"}
SERVER_NAME=${3}

${APIC_CLI} configured-catalog-user-registries:list -o ${ORG_NAME} -c ${CATALOG_NAME} -s ${SERVER_NAME}