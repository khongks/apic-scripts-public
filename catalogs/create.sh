#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

ORG_NAME=${1:-IBM}
CATALOG_NAME=${2:-Test}
OWNER_USERNAME=${3:-khongks}
LUR_NAME=${4:-api-manager-lur}

CATALOG_NAME_SLUGIFIED=$(echo ${CATALOG_NAME} | slugify)

OWNER_URL=$(${DIR}/../users/get-url.sh ${OWNER_USERNAME} ${LUR_NAME} ${ORG_NAME} ${APIMGR_SERVER})

echo "Generating catalog.json file."
cat > catalog.json <<EOF
{
    "type": "catalog",
    "api_version": "2.0.0",
    "name": "${CATALOG_NAME_SLUGIFIED}",
    "title": "${CATALOG_NAME}",
    "owner_url": "${OWNER_URL}"
}
EOF
cat catalog.json

${APIC_CLI} catalogs:create -s ${APIMGR_SERVER} -o ${ORG_NAME} catalog.json
rm catalog.json