#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

CREDENTIAL_NAME=$1
APP_NAME=$2
CONSUMER_ORG_NAME=$3
CATALOG_NAME=$4
ORG_NAME=$5

${APIC_CLI} credentials:delete -s ${APIMGR_SERVER} --org ${ORG_NAME} --catalog ${CATALOG_NAME} --consumer-org ${CONSUMER_ORG_NAME} --app ${APP_NAME} ${CREDENTIAL_NAME} --format json --output -