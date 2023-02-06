#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

MEMBER_NAME=${1}
ORG_NAME=${2:-"IBM"}
SCOPE=${3:-"org"}

$DIR/get.sh ${MEMBER_NAME} ${ORG_NAME} ${SCOPE} | jq -r .url