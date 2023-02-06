#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

PROFILE_NAME=${1} # analytics-client-default
VERSION=${2:-"1.0.0"}
ORG_NAME=${3:-"IBM"}
SERVER_NAME=${4:-"${APIMGR_SERVER}"}

$DIR/get.sh ${PROFILE_NAME} ${VERSION} ${ORG_NAME} ${SERVER_NAME} | jq -r .url