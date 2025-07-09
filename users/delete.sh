#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

USERNAME=${1:-"khongks"}
USER_REGISTRY_NAME=${2:-"api-manager-lur"}
ORG_NAME=${3:-"admin"}

USERNAME_SLUGIFIED=$(echo ${USERNAME} | slugify)
USER_REGISTRY_NAME_SLUGIFIED=$(echo ${USER_REGISTRY_NAME} | slugify)
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

SERVER=${CMC_SERVER}
if [[ ${ORG_NAME} != "admin" ]]; then
    SERVER=${APIMGR_SERVER}
fi

echo "Deleting user: $1"
${APIC_CLI} users:delete --server ${SERVER} --org ${ORG_NAME_SLUGIFIED} --user-registry ${USER_REGISTRY_NAME_SLUGIFIED} ${USERNAME_SLUGIFIED}