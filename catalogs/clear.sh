#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

ORG_NAME=${1:-"IBM"}

${APIC_CLI} catalogs:clear -s ${APIMGR_SERVER} -o ${ORG_NAME} --confirm ${ORG_NAME}