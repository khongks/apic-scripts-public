. ../env.vars

file_name=user-registry-setting.yaml
api_manager_lur_url=$(../user-registry/get-user-registry-url.sh api-manager-lur)
ibm_cloud_private_url=$(../user-registry/get-user-registry-url.sh ibm-cloud-private)

echo "Generating ${file_name} file."
cat >./${file_name} <<EOF
type: user_registry_setting
api_version: 2.0.0
provider_user_registry_urls:
  - >-
    ${ibm_cloud_private_url}
  - >-
    ${api_manager_lur_url}
EOF
cat ./${file_name}

#apic-slim user-registry-settings:update -s $CLOUD_ADMIN_SERVER ./${file_name}
