#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

ORG_NAME=${1:-"IBM"}
SCOPE=${2:-"org"} #[catalog|consumer-org|org|space]

${APIC_CLI} members:list -s ${CLOUD_ADMIN_SERVER} -o ${ORG_NAME} --scope ${SCOPE}