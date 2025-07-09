#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

USER_NAME=$1
USER_REGISTRY_NAME=${2:-"api-manager-lur"}
ORG_NAME=${3:-"IBM"}

USER_NAME_SLUGIFIED=$(echo ${USER_NAME} | slugify)
USER_REGISTRY_NAME_SLUGIFIED=$(echo ${USER_REGISTRY_NAME} | slugify)
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

$DIR/get.sh ${USER_NAME_SLUGIFIED} ${USER_REGISTRY_NAME_SLUGIFIED} ${ORG_NAME_SLUGIFIED} | jq -r '.url'