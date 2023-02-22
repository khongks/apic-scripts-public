#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/./env.vars

REALM=${1:-"admin/default-idp-1"}
 # REALM=${1:-admin/common-services}

#echo "${APIC_CLI} login --context admin -r $REALM -s $CLOUD_ADMIN_SERVER -u $CLOUD_ADMIN_USER -p $CLOUD_ADMIN_PASS --apiKey ${APIC_TOKEN}"
#${APIC_CLI} login --context admin -r $REALM -s $CLOUD_ADMIN_SERVER -u $CLOUD_ADMIN_USER -p $CLOUD_ADMIN_PASS --apiKey ${APIC_TOKEN}

echo "${APIC_CLI} login -r ${REALM} -s ${CLOUD_ADMIN_SERVER} -u ${CLOUD_ADMIN_USER} -p ${CLOUD_ADMIN_PASS}"
${APIC_CLI} login -r ${REALM} -s ${CLOUD_ADMIN_SERVER} -u ${CLOUD_ADMIN_USER} -p ${CLOUD_ADMIN_PASS}
