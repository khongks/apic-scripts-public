#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

ORG_NAME=${1:-"IBM"}
SCOPE=${2:-"org"}

${APIC_CLI} portal-services:list --scope ${SCOPE} -s ${APIMGR_SERVER} -o ${ORG_NAME} --availability-zone ${AVAILABILITY_ZONE}
