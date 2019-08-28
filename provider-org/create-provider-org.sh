. ../env.vars

porg_owner_url=$(../user/get-user-url.sh apimgr api-manager-lur)

echo "Generating ${PORG_NAME}.yaml file."
cat >./${PORG_NAME}.yaml <<EOF
type: org
name: ${PORG_NAME}
owner_url: >-
  ${porg_owner_url}
EOF
cat ./${PORG_NAME}.yaml
echo "Creating provider org: ${PORG_NAME}"
#apic-slim orgs:create --server ${CLOUD_ADMIN_SERVER} ${PORG_NAME}.yaml
