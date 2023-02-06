#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

APP_NAME=${1}
PRODUCT_NAME=${2:-"weather-provider"}
PRODUCT_VERSION=${3:-"2.0.0"}
PLAN_NAME=${4:-"default-plan"}
CONSUMER_ORG_NAME=${5:-"def"}
CATALOG_NAME=${6:-"Test"}
ORG_NAME=${7:-"IBM"}

TITLE="${PRODUCT_NAME} ${PRODUCT_VERSION} ${PLAN_NAME}"

PRODUCT_URL=$($DIR/../products/get-url.sh ${PRODUCT_NAME} ${PRODUCT_VERSION} ${CATALOG_NAME} ${ORG_NAME})

cat > subscription.json <<EOF
{
    "product_url": "${PRODUCT_URL}",
    "plan": "${PLAN_NAME}"
}
EOF
cat subscription.json

echo "${APIC_CLI} subscriptions:create -s ${APIMGR_SERVER} -o ${ORG_NAME} -c ${CATALOG_NAME} --consumer-org ${CONSUMER_ORG_NAME} --app ${APP_NAME} subscription.json"
${APIC_CLI} subscriptions:create -s ${APIMGR_SERVER} -o ${ORG_NAME} -c ${CATALOG_NAME} --consumer-org ${CONSUMER_ORG_NAME} --app ${APP_NAME} subscription.json
rm subscription.json