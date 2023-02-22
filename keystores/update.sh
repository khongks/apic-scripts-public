#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

KEYSTORE_NAME=$1
KEY_FILE=$2
CERT_FILE=$3
ORG_NAME=${4:-"IBM"}
SERVER_NAME=${5:-"${APIMGR_SERVER}"}

KEYSTORE_NAME_SLUGIFIED="$(echo ${KEYSTORE_NAME} | slugify)"

cat > keystore.yaml <<EOF
"name": "${KEYSTORE_NAME_SLUGIFIED}"
"title": "${KEYSTORE_NAME}"
"keystore": "$(awk 'NF {sub(/\r/, ""); printf "%s\\n",$0;}' ${CERT_FILE})$(awk 'NF {sub(/\r/, ""); printf "%s\\n",$0;}' ${KEY_FILE})"
EOF
# cat keystore.yaml

${APIC_CLI} keystores:update -s ${SERVER_NAME} -o ${ORG_NAME} "${KEYSTORE_NAME_SLUGIFIED}" keystore.yaml --format json --output -
rm keystore.yaml