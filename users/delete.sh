#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

USERNAME=${1:-"khongks"}
LUR_NAME=${2:-"api-manager-lur"}
ORG_NAME=${3:-"admin"}

echo "Deleting user: $1"
${APIC_CLI} users:delete --server ${CLOUD_ADMIN_SERVER} --org ${ORG_NAME} --user-registry ${LUR_NAME} ${USERNAME}