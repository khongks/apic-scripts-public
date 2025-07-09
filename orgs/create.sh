#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

ORG_NAME=${1:-"IBM"}
OWNER_NAME=${2:-"khongks"}
USER_REGISTRY_NAME=${3:-"api-manager-lur"}
USER_REGISTRY_ORG_NAME=${4:-"admin"}

echo "${DIR}/../users/get-url.sh ${OWNER_NAME} ${USER_REGISTRY_NAME} ${USER_REGISTRY_ORG_NAME}"
OWNER_URL=$(${DIR}/../users/get-url.sh ${OWNER_NAME} ${USER_REGISTRY_NAME} ${USER_REGISTRY_ORG_NAME})

cat > org.json <<EOF
{
    "type": "org",
    "title": "${ORG_NAME}",
    "name": "$(echo ${ORG_NAME} | slugify)",
    "owner_url": "${OWNER_URL}"
}
EOF
cat org.json

echo "Creating provider org: ${ORG_NAME}"
${APIC_CLI} orgs:create --server ${CMC_SERVER} org.json
rm org.json