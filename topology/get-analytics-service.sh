. ../env.vars
analytics_service_name=$1
apic-slim analytics-services:get ${analytics_service_name} -s ${CLOUD_ADMIN_SERVER} --availability-zone ${AVAILABILITY_ZONE} -o admin
