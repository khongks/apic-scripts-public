#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

PROFILE_NAME=$1
VERSION=${2:-"1.0.0"}
CATALOG_NAME=${3:-"Test"}
ORG_NAME=${4:-"IBM"}
SCOPE=${5:-"catalog"}
SERVER_NAME=$6

${APIC_CLI} configured-tls-client-profiles:get -s ${SERVER_NAME} -o ${ORG_NAME} -c ${CATALOG_NAME} --scope ${SCOPE} --format json --output - ${PROFILE_NAME}:${VERSION}