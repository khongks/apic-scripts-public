. ../env.vars

catalog_name=${CATALOG_NAME}
owner_url=$(../user/get-user-url.sh ${CATALOG_OWNER_USERNAME} ${PORG_LUR})

echo "Generating ${catalog_name}.yaml file."
cat >./${catalog_name}.yaml <<EOF
type: catalog
api_version: 2.0.0
name: ${catalog_name}
title: ${catalog_name}
owner_url: >-
  ${owner_url}
EOF
cat ./${catalog_name}.yaml
apic-slim catalogs:create -s ${PORG_SERVER} -o ${PORG_NAME} ./${catalog_name}.yaml
