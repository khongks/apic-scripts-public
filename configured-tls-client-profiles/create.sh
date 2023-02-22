#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

PROFILE_NAME=$1
VERSION=${2:-"1.0.0"}
CATALOG_NAME=${3:-"Test"}
ORG_NAME=${4:-"IBM"}
SCOPE=${5:-"catalog"}
SERVER_NAME=$6

TLS_CLIENT_PROFILE_URL=$($DIR/../tls-client-profiles/get-url.sh ${PROFILE_NAME} ${VERSION} ${ORG_NAME})
if [ $? -eq 0 ]; then

cat > configured-tls-client-profiles.json <<EOF
{
    "tls_client_profile_url": "${TLS_CLIENT_PROFILE_URL}"
}
EOF
cat configured-tls-client-profiles.json

    echo "TLS client profile [$PROFILE_NAME:$VERSION] found, configure tls client profile for catalog [$CATALOG_NAME]"
    ${APIC_CLI} configured-tls-client-profiles:create -s ${SERVER_NAME} -o ${ORG_NAME} --catalog ${CATALOG_NAME} --scope ${SCOPE} --format json --output - configured-tls-client-profiles.json
    rm configured-tls-client-profiles.json

else
    echo "TLS client profile [$PROFILE_NAME:$VERSION] not found"
fi