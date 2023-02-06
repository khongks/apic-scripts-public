#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

CREDENTIAL_NAME=${1:-"Credential-for-My-Sample-App"}
APP_NAME=${2:-"my-sample-app"}
CONSUMER_ORG_NAME=${3:-"def"}
CATALOG_NAME=${4:-"Test"}
ORG_NAME=${5:-"IBM"}

${APIC_CLI} credentials:reset -s ${APIMGR_SERVER} --org ${ORG_NAME} --catalog ${CATALOG_NAME} --consumer-org ${CONSUMER_ORG_NAME} --app ${APP_NAME} ${CREDENTIAL_NAME} --format json --output -