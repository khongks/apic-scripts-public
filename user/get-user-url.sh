. ../env.vars
user_name=$1
lur=$2
apic-slim users:list --server ${CLOUD_ADMIN_SERVER} --org admin --user-registry ${lur} | grep ${user_name} | awk '{print $NF}'
