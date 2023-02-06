#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

MEMBER_NAME=${1}
LUR_NAME=${2}
ORG_NAME=${3:-"IBM"}
SCOPE=${4:-"org"}

${APIC_CLI} members:delete -s ${CLOUD_ADMIN_SERVER} -o ${ORG_NAME} --scope ${SCOPE} ${MEMBER_NAME}