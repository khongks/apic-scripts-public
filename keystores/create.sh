#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

KEYSTORE_NAME=$1
KEY_FILE=$2
CERT_FILE=$3
ORG_NAME=${4:-"IBM"}
SERVER_NAME=${5:-"${APIMGR_SERVER}"}

cat > keystore.yaml <<EOF
"name": "$(echo ${KEYSTORE_NAME} | slugify)"
"title": "${KEYSTORE_NAME}"
"keystore": "$(awk 'NF {sub(/\r/, ""); printf "%s\\n",$0;}' ${CERT_FILE})$(awk 'NF {sub(/\r/, ""); printf "%s\\n",$0;}' ${KEY_FILE})"
EOF
cat keystore.yaml

${APIC_CLI} keystores:create -s ${SERVER_NAME} -o ${ORG_NAME} keystore.yaml --format yaml
rm keystore.yaml