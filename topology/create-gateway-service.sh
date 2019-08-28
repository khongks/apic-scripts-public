. ../env.vars

integration_url=$(../integration/get-integration-url.sh ${GATEWAY_SERVICE_TYPE})

tls_client_profile_name=tls-client-profile-default:1.0.0
tls_client_profile_url=$(../tls-client-profile/get-tls-client-profile-url.sh ${tls_client_profile_name})

tls_server_profile_name=tls-server-profile-default:1.0.0
tls_server_profile_url=$(../tls-server-profile/get-tls-server-profile-url.sh ${tls_server_profile_name})

analytics_service_url=$(./get-analytics-service-url.sh ${ANALYTICS_SERVICE_NAME})

cat >./${GATEWAY_SERVICE_NAME}.yaml <<EOF
name: ${GATEWAY_SERVICE_NAME}
api_version: 2.0.0
type: gateway_service
title: ${GATEWAY_SERVICE_NAME}
integration_url: >-
  ${integration_url}
gateway_service_type: ${GATEWAY_SERVICE_TYPE}
endpoint: ${GATEWAY_SERVICE_ENDPOINT}
api_endpoint_base: ${GATEWAY_API_ENDPOINT_BASE}
tls_client_profile_url: >-
  ${tls_client_profile_url}
sni:
  - host: '${GATEWAY_HOST}'
    tls_server_profile_url: >-
      ${tls_server_profile_url}
analytics_service_url: >-
  ${analytics_service_url}
EOF
  
cat ./${GATEWAY_SERVICE_NAME}.yaml

apic-slim gateway-services:create -o admin -s ${CLOUD_ADMIN_SERVER} --availability-zone ${AVAILABILITY_ZONE} ${GATEWAY_SERVICE_NAME}.yaml
