#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

USER_REGISTRY_NAME=$1
ORG_NAME=$2
SERVER_NAME=$3

for each in $($DIR/list.sh ${USER_REGISTRY_NAME} ${ORG_NAME} ${SERVER_NAME} | awk '{print $1}'); do

	echo "Deleting $each ..."
	$DIR/delete.sh $each ${USER_REGISTRY_NAME} ${ORG_NAME} ${SERVER_NAME}

done 