#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

MEMBER_NAME=${1}
ROLE_NAME=${2}
LUR_NAME=${3:-"api-manager-lur"}
ORG_NAME=${4:-"IBM"}
SCOPE=${5:-"org"}

USER_URL=$($DIR/../users/get-url.sh ${MEMBER_NAME} ${LUR_NAME} ${ORG_NAME})
ROLE_URL=$($DIR/../roles/get-url.sh ${ROLE_NAME} ${ORG_NAME} ${SCOPE})

echo "Generating member.yaml file."
cat > member.yaml <<EOF
type: member
api_version: 2.0.0
name: $(echo ${MEMBER_NAME} | slugify)
title: ${MEMBER_NAME}
user:
  url: >-
    ${USER_URL}
role_urls:
  - >-
    ${ROLE_URL}
EOF
cat member.yaml

${APIC_CLI} members:create -s ${CLOUD_ADMIN_SERVER} -o ${ORG_NAME} --scope ${SCOPE} member.yaml
rm member.yaml