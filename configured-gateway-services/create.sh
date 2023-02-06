#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

GATEWAY_SERVICE_NAME=${1:-"gateway-service"}
CATALOG_NAME=${2:-Test}
ORG_NAME=${3:-IBM}

GATEWAY_SERVICE_URL=$(${DIR}/../gateway-services/get.sh ${GATEWAY_SERVICE_NAME} | jq -r .url)

cat > gateway-service.json <<EOF
{
   "gateway_service_url": "${GATEWAY_SERVICE_URL}"
}
EOF
cat gateway-service.json

${APIC_CLI} configured-gateway-services:create --scope catalog -s ${APIMGR_SERVER} -o ${ORG_NAME} -c ${CATALOG_NAME} gateway-service.json
rm gateway-service.json