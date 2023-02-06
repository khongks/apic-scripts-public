#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

PROFILE_NAME=${1} 
VERSION=${2:-"1.0.0"}
ORG_NAME=${3:-"IBM"}
SERVER_NAME=${4:-"${APIMGR_SERVER}"}

${APIC_CLI} tls-server-profiles:get -s ${SERVER_NAME} -o ${ORG_NAME} ${PROFILE_NAME}:${VERSION} --format json --output -