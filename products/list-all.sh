#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

CATALOG_NAME=${1:-"Test"}
ORG_NAME=${2:-"IBM"}
SCOPE=${3:-"catalog"}

CATALOG_NAME_SLUGIFIED=$(echo ${CATALOG_NAME} | slugify)
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

${APIC_CLI} products:list-all -s ${APIMGR_SERVER} -o ${ORG_NAME_SLUGIFIED} -c ${CATALOG_NAME_SLUGIFIED} --scope ${SCOPE}
