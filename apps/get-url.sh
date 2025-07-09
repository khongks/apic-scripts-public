#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

APP_NAME=${1:-"my-sample-app"}
CONSUMER_ORG_NAME=${2:-"def"}
CATALOG_NAME=${3:-"Test"}
ORG_NAME=${4:-"IBM"}

APP_NAME_SLUGIFIED=$(echo ${APP_NAME} | slugify)
CONSUMER_ORG_NAME_SLUGIFIED=$(echo ${CONSUMER_ORG_NAME} | slugify)
CATALOG_NAME_SLUGIFIED=$(echo ${CATALOG_NAME} | slugify)
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

$DIR/get.sh ${APP_NAME_SLUGIFIED} ${CATALOG_NAME_SLUGIFIED} ${CATALOG_NAME_SLUGIFIED} ${ORG_NAME_SLUGIFIED} | jq -r '.url'