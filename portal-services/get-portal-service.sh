. ../env.vars
portal_service_name=$1
apic-slim portal-services:get --scope provider -s ${PORG_SERVER} -o ${PORG_NAME} --availability-zone ${AVAILABILITY_ZONE} --scope org ${portal_service_name}
