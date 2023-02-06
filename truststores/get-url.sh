#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

TRUSTSTORE_NAME=$1
ORG_NAME=${2:-"IBM"}
SERVER_NAME=${3:-"${APIMGR_SERVER}"}

$DIR/get.sh ${TRUSTSTORE_NAME} ${ORG_NAME} ${SERVER_NAME} | jq -r .url