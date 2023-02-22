#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

API_ENDPOINTS=$1
CATALOG_NAME=$2
ORG_NAME=$3

echo ${API_ENDPOINTS}
cat > vanity_api_endpoint.json <<EOF
{
    "vanity_api_endpoint": {
        "enabled": true,
        "vanity_api_base_endpoints": [ 
            ${API_ENDPOINTS}
        ]
    }
}  
EOF
cat vanity_api_endpoint.json

${APIC_CLI} catalog-settings:update -s ${APIMGR_SERVER} -o ${ORG_NAME} -c ${CATALOG_NAME} vanity_api_endpoint.json
rm vanity_api_endpoint.json