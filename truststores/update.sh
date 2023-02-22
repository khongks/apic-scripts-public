#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

TRUSTSTORE_NAME=$1
CERT_FILE=$2
ORG_NAME=${3:-"IBM"}
SERVER_NAME=${4:-"${APIMGR_SERVER}"}

TRUSTSTORE_NAME_SLUGIFIED="$(echo ${TRUSTSTORE_NAME} | slugify)"

cat > truststore.yaml <<EOF
"name": "${TRUSTSTORE_NAME_SLUGIFIED}"
"title": "${TRUSTSTORE_NAME}"
"truststore": "$(awk 'NF {sub(/\r/, ""); printf "%s\\n",$0;}' ${CERT_FILE})"
EOF
cat truststore.yaml

${APIC_CLI} truststores:update -s "${SERVER_NAME}" -o "${ORG_NAME}" "${TRUSTSTORE_NAME_SLUGIFIED}" truststore.yaml --format yaml
rm truststore.yaml