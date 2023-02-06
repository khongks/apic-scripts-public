#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

ORG_NAME=${1:-"admin"}

${APIC_CLI} mail-servers:list -o ${ORG_NAME} -s ${CLOUD_ADMIN_SERVER}