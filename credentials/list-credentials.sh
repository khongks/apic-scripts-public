. ../env.vars

P_ORG=$1
CATALOG=$2
C_ORG=$3
APP_NAME=$4

DIR="$(cd "$(dirname "$0")" && pwd)"

apic-slim credentials:list -s ${PORG_SERVER} --org ${P_ORG} --catalog ${CATALOG} --consumer-org ${C_ORG} --app ${APP_NAME}
