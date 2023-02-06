#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

API_MANAGER_LUR_URL=$($DIR/../user-registries/get-url.sh api-manager-lur)
IBM_CLOUD_PRIVATE_URL=$($DIR/../user-registries/get-url.sh common-services)

echo "Generating user-registry-settings.yaml file."
cat > user-registry-settings.yaml <<EOF
type: user_registry_setting
api_version: 2.0.0
provider_user_registry_urls:
  - >-
    ${IBM_CLOUD_PRIVATE_URL}
  - >-
    ${API_MANAGER_LUR_URL}
EOF
cat user-registry-settings.yaml

${APIC_CLI} user-registry-settings:update -s ${CLOUD_ADMIN_SERVER} user-registry-settings.yaml