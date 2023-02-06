#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

CONSUMER_ORG_NAME=${1:-"def"}
CATALOG_NAME=${2:-"Test"}
ORG_NAME=${3:-"IBM"}
SCOPE=${4:-"org"}

${APIC_CLI} apps:list -s ${APIMGR_SERVER} -o ${ORG_NAME} --scope ${SCOPE} --consumer-org ${CONSUMER_ORG_NAME} --catalog ${CATALOG_NAME}