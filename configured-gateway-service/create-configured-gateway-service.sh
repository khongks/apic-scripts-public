. ../env.vars
gateway_service_name=${GATEWAY_SERVICE_NAME}
catalog_name=${CATALOG_NAME}

gateway_service_url=$(../topology/get-gateway-service-url-1.sh ${gateway_service_name})

cat >./${gateway_service_name}.yaml <<EOF
gateway_service_url: >-
   ${gateway_service_url}
EOF
cat ./${gateway_service_name}.yaml

apic-slim configured-gateway-services:create --scope catalog -s ${PORG_SERVER} -o ${PORG_NAME} -c ${catalog_name} ./${gateway_service_name}.yaml
