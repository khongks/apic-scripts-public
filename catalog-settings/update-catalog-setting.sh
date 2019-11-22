. ../env.vars

catalog_name=$1
portal_service_name=$2

file_name=catalog-setting.yaml

web_endpoint_base=$(../portal-services/get-portal-service-1.sh ${portal_service_name} | grep web_endpoint_base | awk '{print $2}' | tr -d "'")

portal_service_url=$(../portal-services/list-portal-services.sh | grep  ${portal_service_name} | awk '{print $2}')

cat >./${file_name} <<EOF
portal:
  type: drupal
  endpoint: ${web_endpoint_base}/${PORG_NAME}/${catalog_name}
  portal_service_url: >-
    ${portal_service_url}
EOF
cat ./${file_name}

apic-slim catalog-settings:update -s ${PORG_SERVER} -o ${PORG_NAME} -c ${catalog_name} ${file_name}
