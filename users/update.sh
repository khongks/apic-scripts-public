#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

#users/update.sh  
# 9cef30a1-5f10-42aa-8c83-7cf64fbe04fd 
# wsvnonproduser 
# firstwsvnonproduser 
# lastwsvnonproduser 
# wsvnonproduser@khongksgmail.onmicrosoft.com 
# azure-oidc 
# admin 
# https://cpd-cp4i.itzroks-3100015379-w96p7r-4b4a324f027aea19c5cbc0c3275c4656-0000.us-east.containers.appdomain.cloud/integration/apis/apic/myapic

ID=$1
NAME=$2
FIRST_NAME=$3
LAST_NAME=$4
EMAIL=$5
USER_REGISTRY_NAME=$6
ORG_NAME=$7

USER_REGISTRY_NAME_SLUGIFIED=$(echo ${USER_REGISTRY_NAME} | slugify)
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

USERNAME="${NAME}"
TITLE="${FIRST_NAME} ${LAST_NAME}"

cat > user.json <<EOF
{
    "name": "${NAME}",
    "username": ${EMAIL},
    "title": "${TITLE}",
    "email": "${EMAIL}",
    "first_name": "${FIRST_NAME}",
    "last_name": "${LAST_NAME}"
}
EOF
cat user.json

SERVER=${CMC_SERVER}
if [[ ${ORG_NAME} != "admin" ]]; then
    SERVER=${APIMGR_SERVER}
fi

echo "Updating user: ${NAME}"
${APIC_CLI} users:update --server "${SERVER}" --org "${ORG_NAME_SLUGIFIED}" --user-registry "${USER_REGISTRY_NAME_SLUGIFIED}" ${ID} user.json
rm user.json