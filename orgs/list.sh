#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

${APIC_CLI} orgs:list --server ${CLOUD_ADMIN_SERVER}