#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

PROFILE_NAME=$1
VERSION=${2:-"1.0.0"}
KEYSTORE_NAME=$3
TRUSTSTORE_NAME=$4
ORG_NAME=${5:-"IBM"}
SERVER_NAME=${6:-"${APIMGR_SERVER}"}

PROFILE_NAME_SLUGIFIED="$(echo ${PROFILE_NAME} | slugify)"

if [ -z "${TRUSTSTORE_NAME}" ]; then

    if [ -z "${KEYSTORE_NAME}" ]; then

        echo "Keystore=N, Truststore=N"

cat > tls-client-profiles.json <<EOF
{
    "name": "${PROFILE_NAME_SLUGIFIED}",
    "title": "${PROFILE_NAME}",
    "version": "${VERSION}"
}
EOF

    else

        echo "Keystore=Y, Truststore=N"
        KEYSTORE_URL=$($DIR/../keystores/get-url.sh ${KEYSTORE_NAME} ${ORG_NAME} ${SERVER_NAME})

cat > tls-client-profiles.json <<EOF
{
    "name": "${PROFILE_NAME_SLUGIFIED}",
    "title": "${PROFILE_NAME}",
    "version": "${VERSION}",
    "keystore_url": "${KEYSTORE_URL}"
}
EOF

    fi
else
    TRUSTSTORE_URL=$($DIR/../truststores/get-url.sh ${TRUSTSTORE_NAME} ${ORG_NAME} ${SERVER_NAME})
    if [ -z "${KEYSTORE_NAME}" ]; then

        echo "Keystore=N, Truststore=Y"

cat > tls-client-profiles.json <<EOF
{
    "name": "${PROFILE_NAME_SLUGIFIED}",
    "title": "${PROFILE_NAME}",
    "version": "${VERSION}",
    "truststore_url": "${TRUSTSTORE_URL}"
}

EOF

    else 

        echo "Keystore=Y, Truststore=Y"
        KEYSTORE_URL=$($DIR/../keystores/get-url.sh ${KEYSTORE_NAME} ${ORG_NAME} ${SERVER_NAME})

cat > tls-client-profiles.json <<EOF
{
    "name": "${PROFILE_NAME_SLUGIFIED}",
    "title": "${PROFILE_NAME}",
    "version": "${VERSION}",
    "keystore_url": "${KEYSTORE_URL}",
    "truststore_url": "${TRUSTSTORE_URL}"
}

EOF
    
    fi
fi
cat tls-client-profiles.json

${APIC_CLI} tls-client-profiles:update -s ${SERVER_NAME} -o ${ORG_NAME} "${PROFILE_NAME_SLUGIFIED}:${VERSION}" tls-client-profiles.json --format json --output -
rm tls-client-profiles.json