. ../env.vars
echo "Listing users"
apic-slim users:list --server ${CLOUD_ADMIN_SERVER} --org admin --user-registry ${PORG_LUR}
