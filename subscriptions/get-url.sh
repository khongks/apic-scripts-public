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

$DIR/get.sh ${SUB_NAME} ${APP_NAME_SLUGIFIED} ${CONSUMER_ORG_NAME_SLUGIFIED} ${CATALOG_NAME_SLUGIFIED} ${ORG_NAME_SLUGIFIED} | jq -r .url