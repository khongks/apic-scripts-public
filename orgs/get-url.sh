#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

ORG_NAME=${1:-"IBM"}
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

$DIR/get.sh ${ORG_NAME_SLUGIFIED} | jq -r .url