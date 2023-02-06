#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

${APIC_CLI} user-registry-settings:get -s ${CLOUD_ADMIN_SERVER} --format json --output -