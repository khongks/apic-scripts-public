. ../env.vars

file_name=my-cloud-setting.yaml
mail_server_url=$(../mail-server/get-mail-server-url.sh ${MAIL_SERVER_NAME})

echo "Generating ./${file_name} file."
cat >./${file_name} <<EOF
type: cloud_setting
api_version: 2.0.0
name: cloud-setting
email_sender:
  address: ${EMAIL_ADDRESS}
mail_server_url: >-
  ${mail_server_url}
EOF
cat ./${file_name}
apic-slim cloud-settings:update -s ${CLOUD_ADMIN_SERVER} ${file_name}
