#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

PORTAL_SERVICE_NAME=${1:-"portal-service"}
ORG_NAME=${2:-"IBM"}
AVAILABILITY_ZONE=${3:-"default"}

ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

${APIC_CLI} portal-services:get -s ${APIMGR_SERVER} -o ${ORG_NAME_SLUGIFIED} --availability-zone ${AVAILABILITY_ZONE} --scope org ${PORTAL_SERVICE_NAME} --output - --format json