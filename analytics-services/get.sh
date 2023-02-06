#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

SERVICE_NAME=${1:-"analytics-service"}

${APIC_CLI} analytics-services:get ${SERVICE_NAME} -s ${CLOUD_ADMIN_SERVER} --availability-zone ${AVAILABILITY_ZONE} -o admin
