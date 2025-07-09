#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

USER_REGISTRY_NAME=$1 # cloud-manager-lur | api-manager-lur | integration-keycloak
ORG_NAME=${2:-"admin"}
VISIBLITY=${3:-"public"} # public | private

USER_REGISTRY_NAME_SLUGIFIED=$(echo ${USER_REGISTRY_NAME} | slugify)
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

cat > visibility.json <<EOF
{
    "type": "user_registry",
    "api_version": "2.0.0",
    "visibility": {
        "type": "${VISIBLITY}"
    }
}
EOF
cat visibility.json

SERVER=${CMC_SERVER}
if [[ ${ORG_NAME} != "admin" ]]; then
    SERVER=${APIMGR_SERVER}
fi

${APIC_CLI} user-registries:update -s ${SERVER} -o ${ORG_NAME_SLUGIFIED} ${USER_REGISTRY_NAME_SLUGIFIED} visibility.json
rm visibility.json