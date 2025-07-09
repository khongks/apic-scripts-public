#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

ORG_NAME=$1
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

cat > org.json <<EOF
{
    "type": "org",
    "title": "${ORG_NAME}",
    "name": ${ORG_NAME_SLUGIFIED}
}
EOF
cat org.json

echo "Update provider org: ${ORG_NAME_SLUGIFIED}"
${APIC_CLI} orgs:update --server ${CMC_SERVER} org.json
rm org.json