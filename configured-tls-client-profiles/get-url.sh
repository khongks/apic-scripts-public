#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

PROFILE_NAME=$1
VERSION=${2:-"1.0.0"}
CATALOG_NAME=${3:-"Test"}
ORG_NAME=${4:-"IBM"}
SCOPE=${5:-"catalog"}
SERVER_NAME=$6

$DIR/get.sh ${PROFILE_NAME} ${VERSION} ${CATALOG_NAME} ${ORG_NAME} ${SCOPE} ${SERVER_NAME} | jq -r .url