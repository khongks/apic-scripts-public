#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

MAIL_SERVER_NAME=${1:-"mail-pit"}
EMAIL_SENDER_NAME=${2:-"APIC Administrator"}
EMAIL_SENDER_ADDRESS=${3:-"admin@apiconnect.net"}


MAIL_SERVER_URL=$(${DIR}/../mail-servers/get-url.sh ${MAIL_SERVER_NAME})

echo "Generating email-settings.json file."
cat > email-settings.json <<EOF
{
    "type": "cloud_setting",
    "api_version": "2.0.0",
    "name": "cloud-setting",
    "email_sender": {
      "name": "${EMAIL_SENDER_NAME}",
      "address": "${EMAIL_SENDER_ADDRESS}"
    },
    "mail_server_url": "${MAIL_SERVER_URL}"
}
EOF
cat email-settings.json
${APIC_CLI} cloud-settings:update -s ${CMC_SERVER} email-settings.json
rm email-settings.json