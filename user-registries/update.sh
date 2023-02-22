#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

USER_REGISTRY_NAME=$1
ADMIN_DN=${2:-"uid=ldapadmin,ou=Users,o=5bffe66af345a831fc65daa0,dc=jumpcloud,dc=com"}
ADMIN_PASSWORD=${3:-"Kks190571!"}
BIND_PREFIX=${4:-"uid="}
BIND_SUFFIX=${5:-",ou=Users,o=5bffe66af345a831fc65daa0,dc=jumpcloud,dc=com"}
SEARCH_DN_BASE=${6:-"ou=Users,o=5bffe66af345a831fc65daa0,dc=jumpcloud,dc=com"}
LDAP_ENDPOINT_URL=${7:-"ldaps://ldap.jumpcloud.com:636"}
TLS_CLIENT_PROFILE_NAME=${8:-"tls-client-profile-default"}
TLS_CLIENT_PROFILE_VERSION=${9:-"1.0.0"}
ORG_NAME=${10:-"admin"}
SERVER_NAME=${11}

ORG_URL=$(${DIR}/../orgs/get-url.sh ${ORG_NAME})
TLS_CLIENT_PROFILE_URL=$(${DIR}/../tls-client-profiles/get-url.sh ${TLS_CLIENT_PROFILE_NAME} ${TLS_CLIENT_PROFILE_VERSION} ${ORG_NAME} ${CLOUD_ADMIN_SERVER})
INTEGRATION_URL=$(${DIR}/../integrations/get-url.sh "ldap" "user-registry")


USER_REGISTRY_NAME_SLUGIFIED=$(echo ${USER_REGISTRY_NAME} | slugify)

cat > user-registry.json <<EOF
{
    "type": "user_registry",
    "api_version": "2.0.0",
    "title": "${USER_REGISTRY_NAME}",
    "name": "${USER_REGISTRY_NAME_SLUGIFIED}",
    "integration_url": "${INTEGRATION_URL}",
    "registry_type": "ldap",
    "user_managed": false,
    "user_registry_managed": false,
    "external_group_mapping_enabled": false,
    "case_sensitive": false,
    "email_required": false,
    "email_unique_if_exist": true,
    "identity_providers": [
        {
            "name": "${USER_REGISTRY_NAME_SLUGIFIED}",
            "title": "${USER_REGISTRY_NAME}"
        }
    ],
    "visibility": {
        "type": "public"
    },
    "configuration": {
        "admin_dn": "${ADMIN_DN}",
        "bind_prefix": "${BIND_PREFIX}",
        "bind_suffix": "${BIND_SUFFIX}",
        "admin_password": "${ADMIN_PASSWORD}",
        "search_dn_base": "${SEARCH_DN_BASE}",
        "protocol_version": "3",
        "attribute_mapping": {},
        "authenticated_bind": "true",
        "authentication_method": "compose_dn"
    },
    "endpoint": {
        "endpoint": "${LDAP_ENDPOINT_URL}",
        "tls_client_profile_url": "${TLS_CLIENT_PROFILE_URL}"
    },
    "org_url": "${ORG_URL}"
}
EOF
cat user-registry.json

# {
#     "type": "user_registry",
#     "api_version": "2.0.0",
#     "id": "3f1d9be1-3381-4710-9c24-9e4f9174f75c",
#     "name": "jump-cloud-secure",
#     "title": "Jump Cloud Secure",
#     "integration_url": "https://cpd-cp4i.apps.ocp-3100015379-53wh.cloud.techzone.ibm.com/integration/apis/apic/myapic/api/cloud/integrations/user-registry/0f9615b9-0f71-4c51-9808-77252b984522",
#     "registry_type": "ldap",
#     "user_managed": false,
#     "user_registry_managed": false,
#     "external_group_mapping_enabled": false,
#     "case_sensitive": false,
#     "email_required": false,
#     "email_unique_if_exist": true,
#     "identity_providers": [
#         {
#             "name": "jump-cloud-secure",
#             "title": "Jump Cloud Secure"
#         }
#     ],
#     "visibility": {
#         "type": "public"
#     },
#     "configuration": {
#         "admin_dn": "uid=ldapadmin,ou=Users,o=5bffe66af345a831fc65daa0,dc=jumpcloud,dc=com",
#         "bind_prefix": "uid=",
#         "bind_suffix": ",ou=Users,o=5bffe66af345a831fc65daa0,dc=jumpcloud,dc=com",
#         "admin_password": "********",
#         "search_dn_base": "ou=Users,o=5bffe66af345a831fc65daa0,dc=jumpcloud,dc=com",
#         "protocol_version": "3",
#         "attribute_mapping": {},
#         "authenticated_bind": "true",
#         "authentication_method": "compose_dn"
#     },
#     "endpoint": {
#         "endpoint": "ldaps://ldap.jumpcloud.com:636",
#         "tls_client_profile_url": "https://cpd-cp4i.apps.ocp-3100015379-53wh.cloud.techzone.ibm.com/integration/apis/apic/myapic/api/orgs/0c083c06-e7cc-4427-ad4b-63b0f9da4203/tls-client-profiles/001abda6-ab73-4652-96ae-1e134fb4734d"
#     },
#     "owned": true,
#     "created_at": "2023-02-14T02:17:15.000Z",
#     "updated_at": "2023-02-14T04:12:12.228Z",
#     "org_url": "https://cpd-cp4i.apps.ocp-3100015379-53wh.cloud.techzone.ibm.com/integration/apis/apic/myapic/api/orgs/0c083c06-e7cc-4427-ad4b-63b0f9da4203",
#     "url": "https://cpd-cp4i.apps.ocp-3100015379-53wh.cloud.techzone.ibm.com/integration/apis/apic/myapic/api/user-registries/0c083c06-e7cc-4427-ad4b-63b0f9da4203/3f1d9be1-3381-4710-9c24-9e4f9174f75c"
# }

${APIC_CLI} user-registries:update -s ${SERVER_NAME} -o ${ORG_NAME} ${USER_REGISTRY_NAME_SLUGIFIED} user-registry.json --format json --output -
rm user-registry.json