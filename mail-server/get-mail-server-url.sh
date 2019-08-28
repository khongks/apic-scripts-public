. ../env.vars
mail_server_name=$1
apic-slim mail-servers:list -o admin -s ${CLOUD_ADMIN_SERVER} | grep ${mail_server_name} | awk '{print $NF}'
