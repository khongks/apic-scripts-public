#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

PRODUCT_NAME=${1:-"weather-provider"}
PRODUCT_VERSION=${2:-"1.0.0"}
CATALOG_NAME=${3:-"Test"}
ORG_NAME=${4:-"IBM"}
SCOPE=${5:-"catalog"}

cat > retire.json <<EOF
{
    "state": "deprecated"
}
EOF
cat retire.json

${APIC_CLI} products:update -s ${APIMGR_SERVER} -o ${ORG_NAME} -c ${CATALOG_NAME} --scope ${SCOPE} ${PRODUCT_NAME}:${PRODUCT_VERSION} retire.json