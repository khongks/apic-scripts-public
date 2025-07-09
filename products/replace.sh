#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

NEW_PRODUCT_FILE=${1}
NEW_PRODUCT_NAME=${2:-"weather-provider"}
NEW_PRODUCT_VERSION=${3:-"2.0.0"}
NEW_PRODUCT_PLAN=${4:-"default-plan"}
OLD_PRODUCT_NAME=${5:-"weather-provider"}
OLD_PRODUCT_VERSION=${6:-"1.0.0"}
OLD_PRODUCT_PLAN=${7:-"default-plan"}
CATALOG_NAME=${8:-"Test"}
ORG_NAME=${9:-"IBM"}
SCOPE=${10:-"catalog"}

NEW_PRODUCT_NAME_SLUGIFIED=$(echo ${NEW_PRODUCT_NAME} | slugify)
OLD_PRODUCT_NAME_SLUGIFIED=$(echo ${OLD_PRODUCT_NAME} | slugify)
CATALOG_NAME_SLUGIFIED=$(echo ${CATALOG_NAME} | slugify)
ORG_NAME_SLUGIFIED=$(echo ${ORG_NAME} | slugify)

OLD_PRODUCT_URL=$($DIR/get-url.sh ${OLD_PRODUCT_NAME_SLUGIFIED})

echo "Generating replace.json file."
cat > replace.yaml <<EOF
product_url: ${OLD_PRODUCT_URL}
plans:
  - source: ${OLD_PRODUCT_PLAN}
    target: ${NEW_PRODUCT_PLAN}
EOF
cat replace.yaml
# {
#   "product_url": "${OLD_PRODUCT_URL}",
#   "plans": {
#     "source": "default-plan",
#     "target": "default-plan"
#   }
# }

$DIR/stage.sh ${NEW_PRODUCT_FILE}

${APIC_CLI} products:replace -s ${APIMGR_SERVER} -o ${ORG_NAME_SLUGIFIED} -c ${CATALOG_NAME_SLUGIFIED} --scope ${SCOPE} ${NEW_PRODUCT_NAME_SLUGIFIED}:${NEW_PRODUCT_VERSION} replace.yaml