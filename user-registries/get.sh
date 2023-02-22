#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

LUR_NAME=$1
ORG_NAME=${2:-"IBM"}
SERVER_NAME=$3

# echo "${APIC_CLI} user-registries:list -s ${CLOUD_ADMIN_SERVER} -o admin --format json --output - | jq --arg NAME "$NAME" '.results[] | select(.name==$NAME)'"
${APIC_CLI} user-registries:get -s ${SERVER_NAME} -o ${ORG_NAME} --format json --output - ${LUR_NAME}
