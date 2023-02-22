#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

USER_NAME=$1
USER_REGISTRY_NAME=$2
ORG_NAME=$3
SERVER_NAME=$4

cat > search.json <<EOF
{
    "username": "${USER_NAME}",
    "remote": true
}
EOF
# cat search.json

${APIC_CLI} user-registries:search --server ${SERVER_NAME} --format json --output - -o ${ORG_NAME} ${USER_REGISTRY_NAME} search.json
rm search.json