#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

CATALOG_NAME=${1:-"Test"}
ORG_NAME=${2:-"IBM"}

$DIR/get.sh ${CATALOG_NAME} ${ORG_NAME} | jq -r .url