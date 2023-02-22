#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

PROFILE_NAME=$1
VERSION=$2
CATALOG_NAME=$3
ORG_NAME=$4
SCOPE=$5
SERVER_NAME=$6

${APIC_CLI} configured-tls-client-profiles:delete -s ${SERVER_NAME} -c ${CATALOG_NAME} -o ${ORG_NAME} --scope ${SCOPE} ${PROFILE_NAME}:${VERSION} 