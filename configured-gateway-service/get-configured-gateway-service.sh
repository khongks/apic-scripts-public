. ../env.vars
gateway_service_name=$1
catalog_name=$2
apic-slim configured-gateway-services:get --scope catalog -s ${PORG_SERVER} -o ${PORG_NAME} -c ${catalog_name} ${gateway_service_name}
