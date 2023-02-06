#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

## ./users/create.sh nicholas passw0rd Nicholas Khong khongnicholas@gmail.com api-manager-lur admin

USERNAME=${1:-khongks}
PASSWORD=${2:-passw0rd}
FIRST_NAME=${3:-"Kok Sing"}
LAST_NAME=${4:-Khong}
EMAIL=${5:-kskhong@au1.ibm.com}
LUR_NAME=${6:-api-manager-lur}
ORG_NAME=${7:-admin}

cat > user.json <<EOF
{
    "username": "${USERNAME}",
    "email": "${EMAIL}",
    "first_name": "${FIRST_NAME}",
    "last_name": "${LAST_NAME}",
    "password": "${PASSWORD}"
}
EOF
cat user.json

echo "Creating user: ${USERNAME}"
${APIC_CLI} users:create --server ${CLOUD_ADMIN_SERVER} --org ${ORG_NAME} --user-registry ${LUR_NAME} user.json
rm user.json