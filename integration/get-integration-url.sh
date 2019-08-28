. ../env.vars
gateway_service_type=$1
apic-slim integrations:list-all -s ${CLOUD_ADMIN_SERVER} | grep ${gateway_service_type} | awk '{print $NF}'
