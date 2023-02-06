#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

LUR_NAME=${1:-api-manager-lur}
ORG_NAME=${2:-admin}

${APIC_CLI} users:list --server ${CLOUD_ADMIN_SERVER} --org ${ORG_NAME} --user-registry ${LUR_NAME}
