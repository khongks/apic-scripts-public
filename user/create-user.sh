. ../env.vars
echo "Generating ${PORG_OWNER_USERNAME}.yaml file."
cat >./${PORG_OWNER_USERNAME}.yaml <<EOF
username: ${PORG_OWNER_USERNAME}
email: ${PORG_OWNER_EMAIL}
first_name: ${PORG_OWNER_FIRSTNAME}
last_name: ${PORG_OWNER_LASTNAME}
password: ${PORG_OWNER_PASSWORD}
EOF
cat ./${PORG_OWNER_USERNAME}.yaml

echo "Creating user: ${PORG_OWNER_USERNAME}"
apic-slim users:create --server ${CLOUD_ADMIN_SERVER} --org admin --user-registry ${PORG_LUR} ${PORG_OWNER_USERNAME}.yaml
