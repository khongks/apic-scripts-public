#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

ORG_NAME=${1:-"admin"}
SERVER_NAME=$2

${APIC_CLI} user-registries:list -s ${SERVER_NAME} -o ${ORG_NAME}