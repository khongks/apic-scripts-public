. ../env.vars
tls_client_profile_name=analytics-client-default:1.0.0
tls_client_profile_url=$(../tls-client-profile/get-tls-client-profile-url.sh ${tls_client_profile_name})

cat >./${ANALYTICS_SERVICE_NAME}.yaml <<EOF
type: analytics_service
name: ${ANALYTICS_SERVICE_NAME}
title: ${ANALYTICS_SERVICE_NAME}
endpoint: ${ANALYTICS_CLIENT_ENDPOINT}
client_endpoint_tls_client_profile_url: >-
  ${tls_client_profile_url}
EOF
cat ./${ANALYTICS_SERVICE_NAME}.yaml
apic-slim analytics-services:create -o admin -s ${CLOUD_ADMIN_SERVER} --availability-zone ${AVAILABILITY_ZONE} ${ANALYTICS_SERVICE_NAME}.yaml
