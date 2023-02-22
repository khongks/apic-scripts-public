#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

CONFIGURED_LUR_NAME=${1:-"Test-catalog-0"}
CATALOG_NAME=${2:-"Test"}
ORG_NAME=${3:-"IBM"}
SERVER_NAME=$4

$DIR/get.sh ${CONFIGURED_LUR_NAME} ${CATALOG_NAME} ${ORG_NAME} ${SERVER_NAME} | jq -r .url