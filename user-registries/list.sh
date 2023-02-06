#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

ORG_NAME=${1:-"admin"}

${APIC_CLI} user-registries:list -s ${CLOUD_ADMIN_SERVER} -o ${ORG_NAME}