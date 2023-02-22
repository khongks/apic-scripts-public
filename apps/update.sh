#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

APP_NAME=${1:-"My Sample App"}
CONSUMER_ORG_NAME=${2:-"def"}
CATALOG_NAME=${3:-"Test"}
ORG_NAME=${4:-"IBM"}

APP_NAME_SLUGIFIED=$(echo ${APP_NAME} | slugify)

cat > app.json <<EOF
{
    "name": "${APP_NAME_SLUGIFIED}",
    "title": "${APP_NAME}"
}
EOF
cat app.json

${APIC_CLI} apps:update -s ${APIMGR_SERVER} -o ${ORG_NAME} --consumer-org ${CONSUMER_ORG_NAME} --catalog ${CATALOG_NAME} --format json --output - ${APP_NAME_SLUGIFIED} app.json

rm app.json