. ../env.vars

tls_client_profile_name=portal-api-admin-default:1.0.0
tls_client_profile_url=$(../tls-client-profile/get-tls-client-profile-url.sh ${tls_client_profile_name})

cat >./${PORTAL_SERVICE_NAME}.yaml <<EOF
type: portal_service
name: ${PORTAL_SERVICE_NAME}
title: ${PORTAL_SERVICE_NAME}
web_endpoint_base: ${PORTAL_WEB_ENDPOINT}
endpoint: ${PORTAL_DIRECTOR_ENDPOINT}
endpoint_tls_client_profile_url: >-
  ${tls_client_profile_url}
EOF
cat ./${PORTAL_SERVICE_NAME}.yaml
apic-slim portal-services:create -o admin -s ${CLOUD_ADMIN_SERVER} --availability-zone ${AVAILABILITY_ZONE} ${PORTAL_SERVICE_NAME}.yaml
