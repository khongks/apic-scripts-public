#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

MAIL_SERVER_NAME=${1:-"mail-trap"}
ORG_NAME=${2:-"admin"}

${APIC_CLI} mail-servers:get -o ${ORG_NAME} -s ${CLOUD_ADMIN_SERVER} ${MAIL_SERVER_NAME} --format json --output -