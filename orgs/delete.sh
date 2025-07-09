#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

ORG_NAME=${1:-IBM}
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

echo "Deleting provider org: ${ORG_NAME_SLUGIFIED}"
${APIC_CLI} orgs:delete --server ${CMC_SERVER} ${ORG_NAME_SLUGIFIED}