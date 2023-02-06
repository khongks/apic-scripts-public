#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

CATALOG_NAME=${1:-"Test"}
ORG_NAME=${2:-"IBM"}
SCOPE=${3:-"catalog"}

${APIC_CLI} products:list-all -s ${APIMGR_SERVER} -o ${ORG_NAME} -c ${CATALOG_NAME} --scope ${SCOPE}
