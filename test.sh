#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/common/common.sh



if isResourceExist "namespace" "mailpit"; then
  echo "Namespace exist"
else
  echo "Namespace does not exist"
fi

if isResourceExist "namespace" "mailpit-wrong"; then
  echo "Namespace exist"
else
  echo "Namespace does not exist"
fi


if isResourceExist "deployment" "mailpit" "mailpit"; then
  echo "Deployment exist"

else
  echo "Deployment does not exist"
fi