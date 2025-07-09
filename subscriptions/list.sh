#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

APP_NAME=${1}
PLAN_NAME=${2:-"default-plan"}
CONSUMER_ORG=${3:-"DEF"}
CATALOG_NAME=${4:-"Test"}
ORG_NAME=${5:-"IBM"}

APP_NAME_SLUGIFIED=$(echo ${APP_NAME} | slugify)
CONSUMER_ORG_NAME_SLUGIFIED=$(echo ${CONSUMER_ORG} | slugify)
CATALOG_NAME_SLUGIFIED=$(echo ${CATALOG_NAME} | slugify)
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

echo "${APIC_CLI} subscriptions:list -s ${APIMGR_SERVER} -o ${ORG_NAME_SLUGIFIED} -c ${CATALOG_NAME_SLUGIFIED} --consumer-org ${CONSUMER_ORG_NAME_SLUGIFIED} --app ${APP_NAME_SLUGIFIED} --plan ${PLAN_NAME} --format json --output -"
${APIC_CLI} subscriptions:list -s ${APIMGR_SERVER} -o ${ORG_NAME_SLUGIFIED} -c ${CATALOG_NAME_SLUGIFIED} --consumer-org ${CONSUMER_ORG_NAME_SLUGIFIED} --app ${APP_NAME_SLUGIFIED} --plan ${PLAN_NAME} --format json --output -