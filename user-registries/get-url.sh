#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

LUR_NAME=$1
ORG_NAME=${2:-"IBM"}

$DIR/get.sh ${LUR_NAME} ${ORG_NAME} | jq -r .url