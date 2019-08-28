. ../env.vars
gateway_service_name=$1
catalog_name=$2
apic-slim configured-gateway-services:list -c $catalog_name --scope catalog -s ${PORG_SERVER} -o ${PORG_NAME} | grep ${gateway_service_name} | awk '{print $NF}'
