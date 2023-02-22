#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

ORG_NAME=${1:-"IBM"}
OWNER_NAME=${2:-"khongks"}
UR_NAME=${3:-"api-manager-lur"}
UR_ORG_NAME=$4

echo "${DIR}/../users/get-url.sh ${OWNER_NAME} ${UR_NAME} ${UR_ORG_NAME} ${CLOUD_ADMIN_SERVER}"
OWNER_URL=$(${DIR}/../users/get-url.sh ${OWNER_NAME} ${UR_NAME} ${UR_ORG_NAME} ${CLOUD_ADMIN_SERVER})

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
${APIC_CLI} orgs:create --server ${CLOUD_ADMIN_SERVER} org.json
rm org.json