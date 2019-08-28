. ../env.vars
portal_service_name=$1
apic-slim portal-services:get ${portal_service_name} -s ${CLOUD_ADMIN_SERVER} --availability-zone ${AVAILABILITY_ZONE} -o admin
