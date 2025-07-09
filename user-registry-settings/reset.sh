#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

COMMON_SERVICES_URL=$(${DIR}/../user-registries/get-url.sh "common-services" "admin" ${CMC_SERVER})
API_MANAGER_LUR_URL=$(${DIR}/../user-registries/get-url.sh "api-manager-lur" "admin" ${CMC_SERVER})

cat > user-registry-settings.json <<EOF
{
    "provider_user_registry_urls": [ 
    	${COMMON_SERVICES_URL},
    	${API_MANAGER_LUR_URL}
    ],
    "provider_user_registry_default_url": "${COMMON_SERVICES_URL}"
}
EOF
cat user-registry-settings.json

${APIC_CLI} user-registry-settings:update -s ${CMC_SERVER} user-registry-settings.json
rm user-registry-settings.json