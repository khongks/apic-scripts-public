#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

## ./users/create.sh nicholas passw0rd Nicholas Khong khongnicholas@gmail.com api-manager-lur admin

USERNAME=$1
PASSWORD=$2
FIRST_NAME=${3:-"Kok Sing"}
LAST_NAME=${4:-Khong}
EMAIL=${5:-kskhong@au1.ibm.com}
USER_REGISTRY_NAME=${6:-api-manager-lur}
ORG_NAME=${7:-admin}

USERNAME_SLUGIFIED=$(echo ${USERNAME} | slugify)
USER_REGISTRY_NAME_SLUGIFIED=$(echo ${USER_REGISTRY_NAME} | slugify)
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

if [ -z "${PASSWORD}" ]; then

cat > user.json <<EOF
{
    "username": "${USERNAME_SLUGIFIED}",
    "email": "${EMAIL}",
    "first_name": "${FIRST_NAME}",
    "last_name": "${LAST_NAME}"
}
EOF

else

cat > user.json <<EOF
{
    "username": "${USERNAME_SLUGIFIED}",
    "email": "${EMAIL}",
    "first_name": "${FIRST_NAME}",
    "last_name": "${LAST_NAME}",
    "password": "${PASSWORD}"
}
EOF

fi

cat user.json

SERVER=${CMC_SERVER}
if [[ ${ORG_NAME} != "admin" ]]; then
    SERVER=${APIMGR_SERVER}
fi

echo "Creating user: ${USERNAME}"
${APIC_CLI} users:create --server ${SERVER} --org ${ORG_NAME_SLUGIFIED} --user-registry ${USER_REGISTRY_NAME_SLUGIFIED} user.json
rm user.json