. ../env.vars
apic-slim roles:list -s ${CLOUD_ADMIN_SERVER} --org admin --scope org | grep $1 | awk '{print $NF}'
