#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

CONSUMER_ORG_NAME=$1
CATALOG_NAME=$2
ORG_NAME=$3

${APIC_CLI} consumer-orgs:get -o ${ORG_NAME} -c ${CATALOG_NAME} -s ${APIMGR_SERVER} ${CONSUMER_ORG_NAME} --format json --output -