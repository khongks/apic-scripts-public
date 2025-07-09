#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

ORG_NAME=${1:-IBM}
CATALOG_NAME=${2:-Test}
OWNER_USERNAME=${3:-khongks}
LUR_NAME=${4:-api-manager-lur}

ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)
CATALOG_NAME_SLUGIFIED=$(echo ${CATALOG_NAME} | slugify)

OWNER_URL=$(${DIR}/../users/get-url.sh ${OWNER_USERNAME} ${LUR_NAME} ${ORG_NAME_SLUGIFIED} ${APIMGR_SERVER})

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

${APIC_CLI} catalogs:create -s ${APIMGR_SERVER} -o ${ORG_NAME_SLUGIFIED} catalog.json
rm catalog.json