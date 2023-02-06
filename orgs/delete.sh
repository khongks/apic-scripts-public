#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

ORG_NAME=${1:-IBM}

echo "Deleting provider org: ${ORG_NAME}"
${APIC_CLI} orgs:delete --server ${CLOUD_ADMIN_SERVER} ${ORG_NAME}