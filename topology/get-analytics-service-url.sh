. ../env.vars
analytics_service_name=$1
apic-slim analytics-services:list -s ${CLOUD_ADMIN_SERVER} --availability-zone ${AVAILABILITY_ZONE} -o admin | grep ${analytics_service_name} | awk {'print $NF'}
