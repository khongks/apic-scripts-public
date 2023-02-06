#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

PROFILE_NAME=$1
VERSION=${2:-"1.0.0"}
CATALOG_NAME=${3:-"Test"}
ORG_NAME=${4:-"IBM"}
SCOPE=${5:-"catalog"}

TLS_CLIENT_PROFILE_URL=$($DIR/../tls-client-profiles/get-url.sh ${PROFILE_NAME} ${VERSION} ${ORG_NAME})

cat > configured-tls-client-profiles.json <<EOF
{
    "tls_client_profile_url": "${TLS_CLIENT_PROFILE_URL}"
}
EOF
cat configured-tls-client-profiles.json

${APIC_CLI} configured-tls-client-profiles:create -s ${APIMGR_SERVER} -o ${ORG_NAME} --catalog ${CATALOG_NAME} --scope ${SCOPE} --format json --output - configured-tls-client-profiles.json
rm configured-tls-client-profiles.json