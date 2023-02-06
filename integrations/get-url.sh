. ./env.vars

DIR=$(dirname $0)
. ${DIR}/../env.vars

# --subcollection [billing|gateway-service|payment-method|user-registry]
NAME=${1:-"datapower-api-gateway"}
SUB_COLLECTION=${2:-"gateway-service"}

${APIC_CLI} integrations:list -s ${CLOUD_ADMIN_SERVER} --subcollection ${SUB_COLLECTION} --format json --output - | jq -r --arg n "$NAME" '.results[]  | select(.name==$n) | .url'
#${APIC_CLI} integrations:list -s ${CLOUD_ADMIN_SERVER} --subcollection ${SUB_COLLECTION} --format json --output -