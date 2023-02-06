#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

ORG_NAME=${1:-"IBM"}

${APIC_CLI} orgs:get --server ${CLOUD_ADMIN_SERVER} ${ORG_NAME} --format json --output -