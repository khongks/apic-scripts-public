#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

ORG_NAME=$1
CATALOG_NAME=$2

${APIC_CLI} consumer-orgs:list -o ${ORG_NAME} -c ${CATALOG_NAME} -s ${APIMGR_SERVER} --format json --output -