#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

NAMESPACE=${1:-mailpit}

if isResourceExist "namespace" "${NAMESPACE}"; then
    echo "Namespace ${NAMESPACE} exist"
    if isResourceExist "service" "mailpit-smtp" "${NAMESPACE}"; then

        MAIL_SERVER_NAME="Mail Pit"
        MAIL_SERVER_HOST="mailpit-smtp.${NAMESPACE}.svc.cluster.local"
        MAIL_SERVER_PORT=$(oc get svc -n mailpit mailpit-smtp -ojsonpath="{.spec.ports[0].port}")
        admin_secret=$(oc get secret -n mailpit mailpit-admin-secret -ojson)
        MAIL_SERVER_USER=$(echo ${admin_secret} | jq -r '.data.MAILPIT_ADMIN_USER' | base64 -d)
        MAIL_SERVER_PASS=$(echo ${admin_secret} | jq -r '.data.MAILPIT_ADMIN_PWD' | base64 -d)

echo "Generating mail-server.json file."
cat > mail-server.json <<EOF
{
    "type": "mail_server",
    "api_version": "2.0.0",
    "name": "$(echo ${MAIL_SERVER_NAME} | slugify)",
    "title": "${MAIL_SERVER_NAME}",
    "host": "${MAIL_SERVER_HOST}",
    "port": ${MAIL_SERVER_PORT},
    "credentials": {
        "username": "${MAIL_SERVER_USER}",
        "password": "${MAIL_SERVER_PASS}"
    }
}
EOF
    else
        echo "Service mailpit-smtp does not exist"
        exit 1
    fi
else
    echo "Namespace ${NAMESPACE} does not exist"
    MAIL_SERVER_NAME=${1:-"Mail Trap"}
    MAIL_SERVER_HOST=${2:-"smtp.mailtrap.io"}
    MAIL_SERVER_PORT=${3:-"2525"}
    MAIL_SERVER_USER=${4:-"1d9875b689a559"}
    MAIL_SERVER_PASS=${5:-"7d723e5ac19641"}

echo "Generating mail-server.json file."
cat > mail-server.json <<EOF
{
    "type": "mail_server",
    "api_version": "2.0.0",
    "name": "$(echo ${MAIL_SERVER_NAME} | slugify)",
    "title": "${MAIL_SERVER_NAME}",
    "host": "${MAIL_SERVER_HOST}",
    "port": ${MAIL_SERVER_PORT},
    "credentials": {
        "username": "${MAIL_SERVER_USER}",
        "password": "${MAIL_SERVER_PASS}"
    }
}
EOF
fi

cat mail-server.json
${APIC_CLI} mail-servers:create -o admin -s ${CMC_SERVER} mail-server.json
rm mail-server.json