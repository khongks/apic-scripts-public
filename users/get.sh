	#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

USER_NAME=$1
USER_REGISTRY_NAME=${2:-"api-manager-lur"}
ORG_NAME=${3:-"IBM"}

USER_NAME_SLUGIFIED=$(echo ${USER_NAME} | slugify)
USER_REGISTRY_NAME_SLUGIFIED=$(echo ${USER_REGISTRY_NAME} | slugify)
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

SERVER=${CMC_SERVER}
if [[ ${ORG_NAME} != "admin" ]]; then
    SERVER=${APIMGR_SERVER}
fi
${APIC_CLI} users:get --server ${SERVER} --format json --output - --org ${ORG_NAME_SLUGIFIED} --user-registry ${USER_REGISTRY_NAME_SLUGIFIED} ${USER_NAME_SLUGIFIED}