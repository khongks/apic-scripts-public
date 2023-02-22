#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

## ./users/create.sh nicholas passw0rd Nicholas Khong khongnicholas@gmail.com api-manager-lur admin

USERNAME=$1
PASSWORD=$2
FIRST_NAME=${3:-"Kok Sing"}
LAST_NAME=${4:-Khong}
EMAIL=${5:-kskhong@au1.ibm.com}
USER_REGISTRY_NAME=${6:-api-manager-lur}
ORG_NAME=${7:-admin}
SERVER_NAME=$8

if [ -z "${PASSWORD}" ]; then

cat > user.json <<EOF
{
    "username": "${USERNAME}",
    "email": "${EMAIL}",
    "first_name": "${FIRST_NAME}",
    "last_name": "${LAST_NAME}"
}
EOF

else

cat > user.json <<EOF
{
    "username": "${USERNAME}",
    "email": "${EMAIL}",
    "first_name": "${FIRST_NAME}",
    "last_name": "${LAST_NAME}",
    "password": "${PASSWORD}"
}
EOF

fi

cat user.json

echo "Creating user: ${USERNAME}"
${APIC_CLI} users:create --server ${SERVER_NAME} --org ${ORG_NAME} --user-registry ${USER_REGISTRY_NAME} user.json
rm user.json