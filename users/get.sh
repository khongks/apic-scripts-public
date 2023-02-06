#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

USER_NAME=$1
LUR_NAME=${2:-"api-manager-lur"}
ORG_NAME=${3:-"IBM"}

${APIC_CLI} users:get --server ${CLOUD_ADMIN_SERVER} --format json --output - --org ${ORG_NAME} --user-registry ${LUR_NAME} ${USER_NAME}