#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

SUB_NAME=${1:-"Weather-Provider-2.0.0-default-plan"}
APP_NAME=${2:-"kks-app"}
CONSUMER_ORG=${3:-"Kok-Sing-Khong"}
CATALOG_NAME=${4:-"Test"}
ORG_NAME=${5:-"IBM"}

$DIR/get.sh ${SUB_NAME} ${APP_NAME} ${CONSUMER_ORG} ${CATALOG_NAME} ${ORG_NAME} | jq -r .url