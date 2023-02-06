#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

${APIC_CLI} integrations:list-all -s ${CLOUD_ADMIN_SERVER}