#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

CATALOG_NAME=${1:-"Test"}
ORG_NAME=${2:-"IBM"}

${APIC_CLI} catalogs:get -s ${APIMGR_SERVER} -o ${ORG_NAME} ${CATALOG_NAME} --format json --output -