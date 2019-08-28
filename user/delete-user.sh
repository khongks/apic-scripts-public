. ../env.vars
echo "Deleting user: $1"
apic-slim users:delete --server ${CLOUD_ADMIN_SERVER} --org admin --user-registry ${PORG_LUR} $1
