#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

LUR_NAME=$1 # cloud-manager-lur | api-manager-lur | common-services
ORG_NAME=${2:-"admin"}
VISIBLITY=${3:-"public"} # public | private
SERVER_NAME=$4

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

${APIC_CLI} user-registries:update -s ${SERVER_NAME} -o ${ORG_NAME} ${LUR_NAME} visibility.json
rm visibility.json