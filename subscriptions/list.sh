#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

APP_NAME=${1}
PLAN_NAME=${2:-"default-plan"}
CONSUMER_ORG=${3:-"DEF"}
CATALOG_NAME=${4:-"Test"}
ORG_NAME=${5:-"IBM"}

echo "${APIC_CLI} subscriptions:list -s ${APIMGR_SERVER} -o ${ORG_NAME} -c ${CATALOG_NAME} --consumer-org ${CONSUMER_ORG} --app ${APP_NAME} --plan ${PLAN_NAME}"
${APIC_CLI} subscriptions:list -s ${APIMGR_SERVER} -o ${ORG_NAME} -c ${CATALOG_NAME} --consumer-org ${CONSUMER_ORG} --app ${APP_NAME} --plan ${PLAN_NAME} --format json --output -