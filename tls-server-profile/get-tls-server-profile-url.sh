. ../env.vars
tls_server_profile_name=$1
apic-slim tls-server-profiles:list-all -s ${CLOUD_ADMIN_SERVER} -o admin | grep ${tls_server_profile_name} | awk '{print $NF}'
