#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

APP_NAME=${1:-"my-sample-app"}
CONSUMER_ORG_NAME=${2:-"def"}
CATALOG_NAME=${3:-"Test"}
ORG_NAME=${4:-"IBM"}

${APIC_CLI} credentials:list -s ${APIMGR_SERVER} --org ${ORG_NAME} --catalog ${CATALOG_NAME} --consumer-org ${CONSUMER_ORG_NAME} --app ${APP_NAME}