. ../env.vars
portal_service_name=$1
apic-slim portal-services:list -s ${CLOUD_ADMIN_SERVER} --availability-zone ${AVAILABILITY_ZONE} -o admin | grep ${portal_service_name} | awk {'print $NF'}
