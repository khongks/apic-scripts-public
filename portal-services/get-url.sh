#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

PORTAL_SERVICE_NAME=${1:-"portal-service"}
ORG_NAME=${2:-"IBM"}

$DIR/get.sh ${PORTAL_SERVICE_NAME} ${ORG_NAME} | jq -r .url