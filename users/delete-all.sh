#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

USER_REGISTRY_NAME=$1
ORG_NAME=$2

USER_REGISTRY_NAME_SLUGIFIED=$(echo ${USER_REGISTRY_NAME} | slugify)
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

for each in $($DIR/list.sh ${USER_REGISTRY_NAME_SLUGIFIED} ${ORG_NAME_SLUGIFIED} | awk '{print $1}'); do

	echo "Deleting $each ..."
	$DIR/delete.sh $each ${USER_REGISTRY_NAME_SLUGIFIED} ${ORG_NAME_SLUGIFIED}

done 