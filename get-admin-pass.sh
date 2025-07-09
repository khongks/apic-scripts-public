#!/bin/bash

NAMESPACE=${1:-apic}
RELEASE_NAME=${2:-apim}

oc get secret -n ${NAMESPACE} ${RELEASE_NAME}-mgmt-admin-pass -o json | jq -r .data.password | base64 -d