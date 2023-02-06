#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

MAIL_SERVER_NAME=${1:-"mail-trap"}
ORG_NAME=${2:-"admin"}

$DIR/get.sh ${MAIL_SERVER_NAME} ${ORG_NAME} | jq -r .url