. ./env.vars

DIR=$(dirname $0)
. ${DIR}/../env.vars

# --subcollection [billing|gateway-service|payment-method|user-registry]
NAME=${1:-"datapower-api-gateway"}
SUB_COLLECTION=${2:-"gateway-service"}

# echo "${APIC_CLI} integrations:get -s ${CLOUD_ADMIN_SERVER}  --output - --format json --subcollection ${SUB_COLLECTION} ${NAME}"
${APIC_CLI} integrations:get -s ${CLOUD_ADMIN_SERVER}  --output - --format json --subcollection ${SUB_COLLECTION} ${NAME}