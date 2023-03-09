#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

USER_REGISTRY_NAME=$1
AZURE_TENANT_ID=$2 # 83100458-a9da-4cf4-bf20-a39f85680132
CLIENT_ID=$3 #482eeaff-1df2-46fd-b202-b1bc237217ba
CLIENT_SECRET=$4 #wqi8Q~iCwqdtli8YQOyshbf6RQMomc-V5MJKJaJm
TLS_CLIENT_PROFILE_NAME=${5:-"tls-client-profile-default"}
TLS_CLIENT_PROFILE_VERSION=${6:-"1.0.0"}
ORG_NAME=${7:-"admin"}
SERVER_NAME=$8

ORG_URL=$(${DIR}/../orgs/get-url.sh ${ORG_NAME})
TLS_CLIENT_PROFILE_URL=$(${DIR}/../tls-client-profiles/get-url.sh ${TLS_CLIENT_PROFILE_NAME} ${TLS_CLIENT_PROFILE_VERSION} ${ORG_NAME} ${SERVER_NAME})
INTEGRATION_URL=$(${DIR}/../integrations/get-url.sh "oidc" "user-registry")

WELL_KNOWN_URL=https://login.microsoftonline.com/${AZURE_TENANT_ID}/v2.0/.well-known/openid-configuration
OPENID_CONFIG=$(curl ${WELL_KNOWN_URL})
AUTHORIZATION_ENDPOINT=$(echo ${OPENID_CONFIG} | jq -r .authorization_endpoint)
TOKEN_ENDPOINT=$(echo ${OPENID_CONFIG} | jq -r .token_endpoint)
USERINFO_ENDPOINT=$(echo ${OPENID_CONFIG} | jq -r .userinfo_endpoint)
JWKS_URI_ENDPOINT=$(echo ${OPENID_CONFIG} | jq -r .jwks_uri)
LOGOUT_ENDPOINT=$(echo ${OPENID_CONFIG} | jq -r .end_session_endpoint)

cat > user-registry.json <<EOF
{
  "name": "${USER_REGISTRY_NAME}",
  "title": "${USER_REGISTRY_NAME}",
  "visibility": {
    "type": "public"
  },
  "case_sensitive": false,
  "email_required": false,
  "email_unique_if_exist": true,
  "configuration": {
    "provider_type": "standard",
    "authorization_endpoint": "${AUTHORIZATION_ENDPOINT}",
    "token_endpoint": {
      "endpoint": "${TOKEN_ENDPOINT}",
      "tls_client_profile_url": "${TLS_CLIENT_PROFILE_URL}"
    },
    "userinfo_endpoint": {
      "endpoint": "${USERINFO_ENDPOINT}",
      "tls_client_profile_url": "${TLS_CLIENT_PROFILE_URL}"
    },
    "jwks_uri": {
      "endpoint": "${JWKS_URI_ENDPOINT}",
      "tls_client_profile_url": "${TLS_CLIENT_PROFILE_URL}"
    },
    "logout_endpoint": "${LOGOUT_ENDPOINT}",
    "client_id": "${CLIENT_ID}",
    "client_secret": "${CLIENT_SECRET}",
    "response_type": "code",
    "scope": "openid email",
    "credential_location": "auth_header",
    "features": [
      "auto_onboard",
      "userinfo"
    ],
    "field_mapping": {
      "email": "email",
      "username": "name",
      "first_name": "given_name",
      "last_name": "family_name"
    }
  },
  "registry_type": "oidc",
  "org_url": "${ORG_URL}",
  "integration_url": "${INTEGRATION_URL}"
}
EOF
# cat user-registry.json
cat user-registry.json

${APIC_CLI} user-registries:create -s ${SERVER_NAME} -o ${ORG_NAME} user-registry.json --format json --output -
rm user-registry.json
