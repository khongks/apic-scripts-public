. ../env.vars
gateway_service_name=$1
apic-slim gateway-services:get ${gateway_service_name} -s ${CLOUD_ADMIN_SERVER} --availability-zone ${AVAILABILITY_ZONE} -o admin
