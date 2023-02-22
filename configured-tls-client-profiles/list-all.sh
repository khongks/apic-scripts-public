#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

CATALOG_NAME=$1
ORG_NAME=$2
SCOPE=${3:-"catalog"}
SERVER_NAME=$4

${APIC_CLI} configured-tls-client-profiles:list-all -s ${SERVER_NAME} -o ${ORG_NAME} -c ${CATALOG_NAME} --scope ${SCOPE}