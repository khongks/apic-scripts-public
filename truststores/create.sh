#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

TRUSTSTORE_NAME=$1
CERT_FILE=$2
ORG_NAME=${3:-"IBM"}
SERVER_NAME=${4:-"${APIMGR_SERVER}"}

cat > keystore.yaml <<EOF
"name": "$(echo ${TRUSTSTORE_NAME} | slugify)"
"title": "${TRUSTSTORE_NAME}"
"truststore": "$(awk 'NF {sub(/\r/, ""); printf "%s\\n",$0;}' ${CERT_FILE})"
EOF
cat keystore.yaml

${APIC_CLI} truststores:create -s ${SERVER_NAME} -o ${ORG_NAME} keystore.yaml --format yaml
rm keystore.yaml