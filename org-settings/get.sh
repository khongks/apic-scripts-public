#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

ORG_NAME=${1:-"IBM"}

${APIC_CLI} org-settings:get --server ${APIMGR_SERVER} -o ${ORG_NAME} --format json --output -