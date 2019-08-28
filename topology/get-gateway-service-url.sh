. ../env.vars
gateway_service_name=$1
apic-slim gateway-services:list -s ${CLOUD_ADMIN_SERVER} --availability-zone ${AVAILABILITY_ZONE} -o admin | grep ${gateway_service_name} | awk {'print $NF'}
