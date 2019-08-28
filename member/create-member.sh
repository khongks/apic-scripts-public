. ../env.vars

user_url=$(../user/get-user-url.sh ${PORG_OWNER_USERNAME} ${PORG_LUR})
role_url=$(../role/get-role-url.sh organization-manager)

echo "Generating ${PORG_OWNER_USERNAME}.yaml file."
cat >./${PORG_OWNER_USERNAME}.yaml <<EOF
type: member
api_version: 2.0.0
name: apimgr
title: apimgr
user:
  url: >-
    $user_url
role_urls:
  - >-
    $role_url
EOF
cat ./${PORG_OWNER_USERNAME}.yaml
apic-slim members:create -s ${CLOUD_ADMIN_SERVER} -o admin --scope org ${PORG_OWNER_USERNAME}.yaml
