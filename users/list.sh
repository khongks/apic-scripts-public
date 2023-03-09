#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

LUR_NAME=${1:-api-manager-lur}
ORG_NAME=${2:-admin}
SERVER_NAME=$3

${APIC_CLI} users:list --server ${SERVER_NAME} --org ${ORG_NAME} --user-registry ${LUR_NAME}