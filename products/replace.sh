#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

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

OLD_PRODUCT_URL=$($DIR/get-url.sh ${OLD_PRODUCT_NAME})

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

echo "${APIC_CLI} products:replace -s ${APIMGR_SERVER} -o ${ORG_NAME} -c ${CATALOG_NAME} --scope ${SCOPE} ${NEW_PRODUCT_NAME}:${NEW_PRODUCT_VERSION} replace.yaml"
${APIC_CLI} products:replace -s ${APIMGR_SERVER} -o ${ORG_NAME} -c ${CATALOG_NAME} --scope ${SCOPE} ${NEW_PRODUCT_NAME}:${NEW_PRODUCT_VERSION} replace.yaml