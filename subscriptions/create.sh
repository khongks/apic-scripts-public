#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

APP_NAME=${1}
PRODUCT_NAME=${2:-"weather-provider"}
PRODUCT_VERSION=${3:-"2.0.0"}
PLAN_NAME=${4:-"default-plan"}
CONSUMER_ORG_NAME=${5:-"def"}
CATALOG_NAME=${6:-"Test"}
ORG_NAME=${7:-"IBM"}

APP_NAME_SLUGIFIED=$(echo ${APP_NAME} | slugify)
PRODUCT_NAME_SLUGIFIED=$(echo ${PRODUCT_NAME} | slugify)
CONSUMER_ORG_NAME_SLUGIFIED=$(echo ${CONSUMER_ORG_NAME} | slugify)
CATALOG_NAME_SLUGIFIED=$(echo ${CATALOG_NAME} | slugify)
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

TITLE="${PRODUCT_NAME_SLUGIFIED} ${PRODUCT_VERSION} ${PLAN_NAME}"

PRODUCT_URL=$($DIR/../products/get-url.sh ${PRODUCT_NAME_SLUGIFIED} ${PRODUCT_VERSION} ${CATALOG_NAME_SLUGIFIED} ${ORG_NAME_SLUGIFIED})

cat > subscription.json <<EOF
{
    "product_url": "${PRODUCT_URL}",
    "plan": "${PLAN_NAME}"
}
EOF
cat subscription.json

${APIC_CLI} subscriptions:create -s ${APIMGR_SERVER} -o ${ORG_NAME_SLUGIFIED} -c ${CATALOG_NAME_SLUGIFIED} --consumer-org ${CONSUMER_ORG_NAME_SLUGIFIED} --app ${APP_NAME_SLUGIFIED} subscription.json
rm subscription.json