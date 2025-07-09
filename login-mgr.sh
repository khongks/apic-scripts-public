#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/env.vars
. ${DIR}/common/common.sh

OWNER_NAME=${1:-khongks}
OWNER_PASSWORD=${2:-"Passw0rd!"}
PROVIDER_REALM=${3:-provider/default-idp-2}

echo "${APIC_CLI} login --realm ${PROVIDER_REALM} --server ${APIMGR_SERVER} --username ${OWNER_NAME} --password ********"
${APIC_CLI} login --realm ${PROVIDER_REALM} --server ${APIMGR_SERVER} --username ${OWNER_NAME} --password "${OWNER_PASSWORD}"