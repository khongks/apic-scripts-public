#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

ORG_NAME=${1:-"admin"}
SCOPE=${2:-"org"}

${APIC_CLI} roles:list -s ${CLOUD_ADMIN_SERVER} --org ${ORG_NAME} --scope ${SCOPE}