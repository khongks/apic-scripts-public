#!/bin/bash

##
## Set your environment variables
##
. ./env.vars
. ./oidc-azure-ad.vars

##
## Login to cloud admin
##
./login-cmc.sh

##
## Create OIDC user registry
##
USER_REGISTRY_NAME_SLUGIFIED=$(echo ${USER_REGISTRY_NAME} | slugify)
./user-registries/get.sh "${USER_REGISTRY_NAME_SLUGIFIED}" "${ADMIN_ORG_NAME}" "${CLOUD_ADMIN_SERVER}" > /dev/null 2>&1
if [ $? -eq 0 ]; then
        echo "User registry ${USER_REGISTRY_NAME_SLUGIFIED} already exist."
else
        echo "Create user registry ${USER_REGISTRY_NAME_SLUGIFIED}."
        ./user-registries/create-azure-ad-oidc.sh \
                "${USER_REGISTRY_NAME_SLUGIFIED}" \
                "${AZURE_TENANT_ID}" \
                "${AZURE_AD_CLIENT_ID}" \
                "${AZURE_AD_CLIENT_SECRET}" \
                "${DEF_TLS_CLIENT_PROFILE_NAME}" \
                "${DEF_TLS_CLIENT_PROFILE_VERSION}" \
                "${ADMIN_ORG_NAME}" \
                "${CLOUD_ADMIN_SERVER}"
fi

##
## Add User Registry to Organization default
## 
./user-registry-settings/add-user-registry-to-org.sh "${USER_REGISTRY_NAME_SLUGIFIED}" "${ADMIN_ORG_NAME}"
