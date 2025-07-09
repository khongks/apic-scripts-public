#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

USER_NAME=$1
USER_REGISTRY_NAME=$2
ORG_NAME=$3

USER_NAME_SLUGIFIED=$(echo ${USER_NAME} | slugify)
USER_REGISTRY_NAME_SLUGIFIED=$(echo ${USER_REGISTRY_NAME} | slugify)
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

cat > search.json <<EOF
{
    "username": "${USER_NAME_SLUGIFIED}",
    "remote": true
}
EOF
# cat search.json

SERVER=${CMC_SERVER}
if [[ ${ORG_NAME} != "admin" ]]; then
    SERVER=${APIMGR_SERVER}
fi

${APIC_CLI} user-registries:search --server ${SERVER} --format json --output - -o ${ORG_NAME_SLUGIFIED} ${USER_REGISTRY_NAME_SLUGIFIED} search.json
rm search.json