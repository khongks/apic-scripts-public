#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

SERVICE_NAME=${1:-"analytics-service"}

${APIC_CLI} analytics-services:get ${SERVICE_NAME} -s ${CMC_SERVER} --availability-zone ${AVAILABILITY_ZONE} -o admin
