#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

USERNAME=${1:-"khongks"}
USER_REGISTRY_NAME=${2:-"api-manager-lur"}
ORG_NAME=${3:-"admin"}
SERVER_NAME=$4

echo "Deleting user: $1"
${APIC_CLI} users:delete --server ${SERVER_NAME} --org ${ORG_NAME} --user-registry ${USER_REGISTRY_NAME} ${USERNAME}