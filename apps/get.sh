#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

APP_NAME=${1:-"my-sample-app"}
CONSUMER_ORG_NAME=${2:-"def"}
CATALOG_NAME=${3:-"Test"}
ORG_NAME=${4:-"IBM"}

${APIC_CLI} apps:get -s ${APIMGR_SERVER} -o ${ORG_NAME} --consumer-org ${CONSUMER_ORG_NAME} --catalog ${CATALOG_NAME} ${APP_NAME} --format json --output -