#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

MEMBER_NAME=${1}
ORG_NAME=${2:-"IBM"}
SCOPE=${3:-"org"}

${APIC_CLI} members:get -s ${CLOUD_ADMIN_SERVER} -o ${ORG_NAME} --scope ${SCOPE} ${MEMBER_NAME} --format json --output -