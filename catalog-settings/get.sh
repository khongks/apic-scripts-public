#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

CATALOG_NAME=${1:-"Test"}
ORG_NAME=${2:-"IBM"}

${APIC_CLI} catalog-settings:get -s ${APIMGR_SERVER} -o ${ORG_NAME} -c ${CATALOG_NAME} --format json --output -