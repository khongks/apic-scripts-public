#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

CATALOG_NAME=${1:-"Test"}
ORG_NAME=${2:-"IBM"}
PORTAL_SERVICE_NAME=${3:-"portal-service"}

PORTAL_SERVICE_JSON=$(${DIR}/../portal-services/get.sh)
echo ${PORTAL_SERVICE_JSON}

WEB_ENDPOINT_BASE=$(echo ${PORTAL_SERVICE_JSON} | jq -r '.web_endpoint_base')
PORTAL_SERVICE_URL=$(echo ${PORTAL_SERVICE_JSON} | jq -r '.url')
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)
CATALOG_NAME_SLUGIFIED=$(echo ${CATALOG_NAME} | slugify)

cat > portal.json <<EOF
{
    "portal": {
        "type": "drupal",
        "endpoint": "${WEB_ENDPOINT_BASE}${ORG_NAME_SLUGIFIED}/${CATALOG_NAME_SLUGIFIED}",
        "portal_service_url": "${PORTAL_SERVICE_URL}"
    }
}  
EOF
cat portal.json

${APIC_CLI} catalog-settings:update -s ${APIMGR_SERVER} -o ${ORG_NAME} -c ${CATALOG_NAME} portal.json
rm portal.json