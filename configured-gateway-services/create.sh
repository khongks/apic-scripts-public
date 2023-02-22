#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

GATEWAY_SERVICE_NAME=${1:-"gateway-service"}
CATALOG_NAME=${2:-Test}
ORG_NAME=${3:-IBM}

GATEWAY_SERVICE_URL=$(${DIR}/../gateway-services/get-url.sh ${GATEWAY_SERVICE_NAME} ${AVAILABILITY_ZONE} ${ORG_NAME} "org")
echo "${DIR}/../gateway-services/get-url.sh ${GATEWAY_SERVICE_NAME} ${AVAILABILITY_ZONE} ${ORG_NAME} "org""
if [ $? -eq 0 ]; then

cat > gateway-service.json <<EOF
{
   "gateway_service_url": "${GATEWAY_SERVICE_URL}"
}
EOF
cat gateway-service.json

   echo "Gateway service [$GATEWAY_SERVICE_NAME] found, configure gateway service for catalog [$CATALOG_NAME]"
   ${APIC_CLI} configured-gateway-services:create --scope catalog -s ${APIMGR_SERVER} -o ${ORG_NAME} -c ${CATALOG_NAME} gateway-service.json
   rm gateway-service.json

else
    echo "Gateway service [$GATEWAY_SERVICE_NAME] not found"
fi

