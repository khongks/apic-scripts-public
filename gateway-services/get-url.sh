#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

GATEWAY_SERVICE_NAME=${1:-"gateway-service"}
AVAILABILITY_ZONE=${2:-"availability-zone-default"}
ORG_NAME=${3:-"IBM"}
SCOPE=${4:-"org"}

$DIR/get.sh ${GATEWAY_SERVICE_NAME} ${AVAILABILITY_ZONE} ${ORG_NAME} ${SCOPE} | jq -r .url