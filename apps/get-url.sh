#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

APP_NAME=${1:-"my-sample-app"}
CONSUMER_ORG_NAME=${2:-"def"}
CATALOG_NAME=${3:-"Test"}
ORG_NAME=${4:-"IBM"}

$DIR/get.sh ${APP_NAME} ${CONSUMER_ORG_NAME} ${CATALOG_NAME} ${ORG_NAME} | jq -r '.url'