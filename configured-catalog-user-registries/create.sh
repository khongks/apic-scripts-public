#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

CONFIGURED_UR_NAME=$1
CATALOG_NAME=$2
ORG_NAME=$3
SERVER_NAME=$4

USER_REGISTRY_URL=$(${DIR}/../user-registries/get-url.sh ${CONFIGURED_UR_NAME} ${ORG_NAME} ${SERVER_NAME})
if [ $? -eq 0 ]; then

echo "Generating configured-catalog-user-registry.json file."
cat > configured-catalog-user-registry.json <<EOF
{
  "user_registry_url": "${USER_REGISTRY_URL}"
}
EOF
cat configured-catalog-user-registry.json
  
  echo "User catalog registry [$CONFIGURED_UR_NAME] found, configure catalog user registry [$CATALOG_NAME]"
  ${APIC_CLI} configured-catalog-user-registries:create -o ${ORG_NAME} -c ${CATALOG_NAME} -s ${SERVER_NAME} configured-catalog-user-registry.json --format json --output -
  rm configured-catalog-user-registry.json

else 

  echo "User catalog registry [$CONFIGURED_UR_NAME] not found"

fi



