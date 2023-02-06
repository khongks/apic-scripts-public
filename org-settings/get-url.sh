#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

ORG_NAME=${1:-"IBM"}

$DIR/get-url.sh ${ORG_NAME} | jq -r .url