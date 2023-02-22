#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

CONSUMER_ORG_NAME=$1
CATALOG_NAME=$2
ORG_NAME=$3

${APIC_CLI} apps:clear -s ${APIMGR_SERVER} -o ${ORG_NAME} --consumer-org ${CONSUMER_ORG_NAME} --catalog ${CATALOG_NAME} --confirm ${CONSUMER_ORG_NAME}