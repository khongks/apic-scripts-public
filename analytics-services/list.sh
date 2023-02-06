#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

${APIC_CLI} analytics-services:list -s ${CLOUD_ADMIN_SERVER} --availability-zone ${AVAILABILITY_ZONE} -o admin