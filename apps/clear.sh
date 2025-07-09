#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

CONSUMER_ORG_NAME=$1
CATALOG_NAME=$2
ORG_NAME=$3

CONSUMER_ORG_NAME_SLUGIFIED=$(echo ${CONSUMER_ORG_NAME} | slugify)
CATALOG_NAME_SLUGIFIED=$(echo ${CATALOG_NAME} | slugify)
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

${APIC_CLI} apps:clear -s ${APIMGR_SERVER} -o ${ORG_NAME_SLUGIFIED}} --consumer-org ${CONSUMER_ORG_NAME_SLUGIFIED} --catalog ${CATALOG_NAME_SLUGIFIED} --confirm ${CONSUMER_ORG_NAME_SLUGIFIED}