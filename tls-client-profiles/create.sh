#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

PROFILE_NAME=$1
VERSION=${2:-"1.0.0"}
KEYSTORE_NAME=$3
TRUSTSTORE_NAME=$4
ORG_NAME=${5:-"IBM"}
SERVER_NAME=${6:-"${APIMGR_SERVER}"}

KEYSTORE_URL=$($DIR/../keystores/get-url.sh ${KEYSTORE_NAME})
TRUSTSTORE_URL=$($DIR/../truststores/get-url.sh ${TRUSTSTORE_NAME})

cat > tls-server-profiles.json <<EOF
{
    "name": "$(echo ${PROFILE_NAME} | slugify)",
    "title": "${PROFILE_NAME}",
    "version": "${VERSION}",
    "keystore_url": "${KEYSTORE_URL}",
    "truststore_url": "${TRUSTSTORE_URL}"
}
EOF
cat tls-server-profiles.json

${APIC_CLI} tls-server-profiles:create -s ${SERVER_NAME} -o ${ORG_NAME} tls-server-profiles.json --format json --output -
rm tls-server-profiles.json