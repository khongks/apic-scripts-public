#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

ORG_NAME=${1:-"admin"}
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

SERVER=${CMC_SERVER}
if [[ ${ORG_NAME} != "admin" ]]; then
    SERVER=${APIMGR_SERVER}
fi

${APIC_CLI} user-registries:list -s ${SERVER} -o ${ORG_NAME_SLUGIFIED}