#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

USER_NAME=$1
LUR_NAME=${2:-"api-manager-lur"}
ORG_NAME=${3:-"IBM"}
SERVER_NAME=$4

#echo "$DIR/get.sh ${USER_NAME} ${LUR_NAME} ${ORG_NAME} ${SERVER_NAME} | jq -r '.url'"
$DIR/get.sh ${USER_NAME} ${LUR_NAME} ${ORG_NAME} ${SERVER_NAME} | jq -r '.url'