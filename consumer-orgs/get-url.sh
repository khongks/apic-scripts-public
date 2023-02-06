#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

CONSUMER_ORG_NAME=${1:-"abc"}
CATALOG_NAME=${2:-"Test"}
ORG_NAME=${3:-"IBM"}

$DIR/get.sh ${CONSUMER_ORG_NAME} ${CATALOG_NAME} ${ORG_NAME} | jq -r .url