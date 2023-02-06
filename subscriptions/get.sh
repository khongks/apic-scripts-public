#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

SUB_NAME=${1:-"Weather-Provider-2.0.0-default-plan"}
APP_NAME=${2:-"kks-app"}
CONSUMER_ORG=${3:-"Kok-Sing-Khong"}
CATALOG_NAME=${4:-"Test"}
ORG_NAME=${5:-"IBM"}

# echo "${APIC_CLI} subscriptions:get -s ${APIMGR_SERVER} -o ${ORG_NAME} -c ${CATALOG_NAME} --consumer-org ${CONSUMER_ORG} --app ${APP_NAME} ${SUB_NAME} --format json --output -"
${APIC_CLI} subscriptions:get -s ${APIMGR_SERVER} -o ${ORG_NAME} -c ${CATALOG_NAME} --consumer-org ${CONSUMER_ORG} --app ${APP_NAME} ${SUB_NAME} --format json --output -