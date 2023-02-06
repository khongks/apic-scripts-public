#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

${APIC_CLI} me:get -s ${CLOUD_ADMIN_SERVER} --format json --output -