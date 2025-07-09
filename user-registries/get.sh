#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

USER_REGISTRY_NAME=$1
ORG_NAME=${2:-"admin"}
USER_REGISTRY_NAME_SLUGIFIED=$(echo ${LUR_NAME} | slugify)
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

SERVER=${CMC_SERVER}
if [[ ${ORG_NAME} != "admin" ]]; then
    SERVER=${APIMGR_SERVER}
fi

${APIC_CLI} user-registries:get -s ${SERVER} -o ${ORG_NAME_SLUGIFIED} --format json --output - ${USER_REGISTRY_NAME_SLUGIFIED}
