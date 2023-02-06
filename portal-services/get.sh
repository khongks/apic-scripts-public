#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

PORTAL_SERVICE_NAME=${1:-"portal-service"}
ORG_NAME=${2:-"IBM"}

${APIC_CLI} portal-services:get -s ${APIMGR_SERVER} -o ${ORG_NAME} --availability-zone ${AVAILABILITY_ZONE} --scope org ${PORTAL_SERVICE_NAME} --output - --format json