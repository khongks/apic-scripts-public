#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

ORG_NAME=${1:-IBM}
OWNER_NAME=${2:-khongks}
LUR_NAME=${3:-api-manager-lur}
# ${DIR}/../users/get.sh ${OWNER_NAME} ${LUR_NAME}
OWNER_URL=$(${DIR}/../users/get-url.sh ${OWNER_NAME} ${LUR_NAME})

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