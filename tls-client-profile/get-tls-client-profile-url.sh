. ../env.vars
tls_client_profile_name=$1
apic-slim tls-client-profiles:list-all -s ${CLOUD_ADMIN_SERVER} -o admin | grep ${tls_client_profile_name} | awk '{print $NF}'
