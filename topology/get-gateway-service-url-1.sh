. ../env.vars
gateway_service_name=$1
org_name=${PORG_NAME}
apic-slim gateway-services:list -s ${PORG_SERVER}  -o ${org_name} --scope org | grep ${gateway_service_name} | awk {'print $NF'}
