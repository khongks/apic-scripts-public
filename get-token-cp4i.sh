#!/bin/bash

CP4I_NAMESPACE=${1:-cp4i}
APIC_NAMESPACE=${2:-apic-mgmt}
APIC_RELEASE_NAME=${3:-myapic}

CP4I_ENDPOINT=`oc get route -n ${CP4I_NAMESPACE} cpd -ojson | jq -r '.spec.host'`
CP4I_USER=`oc get secret -n ibm-common-services platform-auth-idp-credentials -o json | jq -r '.data.admin_username' | base64 -d`
CP4I_PASSWORD=`oc get secret -n ibm-common-services platform-auth-idp-credentials -o json | jq -r '.data.admin_password' | base64 -d`

APIC_SERVER_ENDPOINT=https://${CP4I_ENDPOINT}/integration/apis/${APIC_NAMESPACE}/${APIC_RELEASE_NAME}

echo "APIC_SERVER_ENDPOINT: " ${APIC_SERVER_ENDPOINT}

apic client-creds:set ./credentials.json

echo "apic login --server ${APIC_SERVER_ENDPOINT} --context admin --username ${CP4I_USER} --password ${CP4I_PASSWORD} --realm admin/common-services --sso"
apic login --server ${APIC_SERVER_ENDPOINT} --context admin --username ${CP4I_USER} --password ${CP4I_PASSWORD} --realm admin/common-services --sso