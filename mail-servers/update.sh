#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

MAIL_SERVER_NAME=${1:-"Mail Trap"}
MAIL_SERVER_HOST=${2:-"smtp.mailtrap.io"}
MAIL_SERVER_PORT=${3:-"2525"}
MAIL_SERVER_USER=${4:-"1d9875b689a559"}
MAIL_SERVER_PASS=${5:-"7d723e5ac19641"}

MAIL_SERVER_NAME_SLUGIFIED=$(echo ${MAIL_SERVER_NAME} | slugify)

echo "Generating mail-server.json file."
cat > mail-server.json <<EOF
{
    "type": "mail_server",
    "api_version": "2.0.0",
    "name": "${MAIL_SERVER_NAME_SLUGIFIED}",
    "title": "${MAIL_SERVER_NAME}",
    "host": "${MAIL_SERVER_HOST}",
    "port": ${MAIL_SERVER_PORT},
    "credentials": {
        "username": "${MAIL_SERVER_USER}",
        "password": "${MAIL_SERVER_PASS}"
    }
}
EOF
cat mail-server.json

${APIC_CLI} mail-servers:update -o admin -s ${CLOUD_ADMIN_SERVER} ${MAIL_SERVER_NAME_SLUGIFIED} mail-server.json
rm mail-server.json