#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/env.vars 

apic client-creds:clear
echo "${APIC_CLI} login -r ${CMC_ADMIN_REALM} -s ${CMC_SERVER} -u ${CMC_ADMIN_USER} -p *********"
${APIC_CLI} login -r ${CMC_ADMIN_REALM} -s ${CMC_SERVER} -u ${CMC_ADMIN_USER} -p "${CMC_ADMIN_PASS}"
