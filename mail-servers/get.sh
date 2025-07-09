#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

MAIL_SERVER_NAME=${1:-"dummy-mail-server"}
ORG_NAME=${2:-"admin"}

${APIC_CLI} mail-servers:get -o ${ORG_NAME} -s ${CMC_SERVER} ${MAIL_SERVER_NAME} --format json --output -