#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

ROLE_NAME=${1}
ORG_NAME=${2:-"admin"}
SCOPE=${3:-"org"}

${APIC_CLI} roles:get -s ${CLOUD_ADMIN_SERVER} --org ${ORG_NAME} --scope ${SCOPE} ${ROLE_NAME} --format json --output -