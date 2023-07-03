#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

ORG_NAME=$1
CFG_FILE_NAME=$2
FOLDER_NAME=$3
SERVER_NAME=$4

## apic gateway-extensions:create


cd $FOLDER_NAME
zip gateway-extensions.zip $CFG_FILE_NAME
cd ..

${APIC_CLI} gateway-extensions:create -s ${SERVER_NAME} -o ${ORG_NAME} $FOLDER_NAME/gateway-extensions.zip

rm gateway-extensions.zip

./gateway-extensions.zip --format json --scope org --org admin --gateway-service aws-internal-gateway --availability-zone availability-zone-default --server cm.apic.nonprod.aws.bencloud
