#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

CONSUMER_ORG_NAME=$1
CATALOG_NAME=$2
ORG_NAME=$3

$DIR/get.sh ${CONSUMER_ORG_NAME} ${CATALOG_NAME} ${ORG_NAME} | jq -r .url