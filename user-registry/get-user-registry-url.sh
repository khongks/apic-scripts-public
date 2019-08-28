. ../env.vars
user_registry_name=$1
apic-slim user-registries:list -s $CLOUD_ADMIN_SERVER -o admin | grep ${user_registry_name} | awk '{print $NF}'
