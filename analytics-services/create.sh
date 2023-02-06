#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

TLS_CLIENT_PROFILE_NAME=${1:-"analytics-client-default:1.0.0"}
AVAILABILITY_ZONE=${2:-"availability-zone-default"}

tls_client_profile_url=$(../tls-client-profiles/get.sh ${tls_client_profile_name} | jq -r .url)

cat > analytics-service.yaml <<EOF
type: analytics_service
name: ${ANALYTICS_SERVICE_NAME}
title: ${ANALYTICS_SERVICE_NAME}
endpoint: ${ANALYTICS_CLIENT_ENDPOINT}
client_endpoint_tls_client_profile_url: >-
  ${tls_client_profile_url}
EOF
cat analytics-service.yaml

${APIC_CLI} analytics-services:create -o admin -s ${CLOUD_ADMIN_SERVER} --availability-zone ${AVAILABILITY_ZONE} analytics-service.yaml