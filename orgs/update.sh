#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

ORG_NAME=$1

cat > org.json <<EOF
{
    "type": "org",
    "title": "${ORG_NAME}",
    "name": "$(echo ${ORG_NAME} | slugify)"
}
EOF
cat org.json

echo "Update provider org: ${ORG_NAME}"
${APIC_CLI} orgs:create --server ${CLOUD_ADMIN_SERVER} org.json
rm org.json