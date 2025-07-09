#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

SUB_NAME=${1:-"Weather-Provider-2.0.0-default-plan"}
APP_NAME=${2:-"kks-app"}
CONSUMER_ORG=${3:-"Kok-Sing-Khong"}
CATALOG_NAME=${4:-"Test"}
ORG_NAME=${5:-"IBM"}

APP_NAME_SLUGIFIED=$(echo ${APP_NAME} | slugify)
CONSUMER_ORG_NAME_SLUGIFIED=$(echo ${CONSUMER_ORG} | slugify)
CATALOG_NAME_SLUGIFIED=$(echo ${CATALOG_NAME} | slugify)
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

${APIC_CLI} subscriptions:get -s ${APIMGR_SERVER} -o ${ORG_NAME_SLUGIFIED} -c ${CATALOG_NAME_SLUGIFIED} --consumer-org ${CONSUMER_ORG_NAME_SLUGIFIED} --app ${APP_NAME_SLUGIFIED} ${SUB_NAME} --format json --output -