. ../env.vars
echo "Generating ${MAIL_SERVER_NAME}.yaml file."
cat >./${MAIL_SERVER_NAME}.yaml <<EOF
type: mail_server
api_version: 2.0.0
name: ${MAIL_SERVER_NAME}
title: ${MAIL_SERVER_NAME}
host: ${MAIL_SERVER_HOST}
port: ${MAIL_SERVER_PORT}
EOF
cat ./${MAIL_SERVER_NAME}.yaml
apic-slim mail-servers:create -o admin -s ${CLOUD_ADMIN_SERVER} ${MAIL_SERVER_NAME}.yaml
