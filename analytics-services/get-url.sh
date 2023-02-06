#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

SERVICE_NAME=${1:-"analytics-service"}

$DIR/get.sh ${SERVICE_NAME} | jq -r .url