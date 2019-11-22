. ../env.vars

P_ORG=$1
CATALOG=$2
C_ORG=$3
APP=$4
CRED=$5

DIR="$(cd "$(dirname "$0")" && pwd)"

apic-slim credentials:get -s ${PORG_SERVER} --org ${P_ORG} --catalog ${CATALOG} --consumer-org ${C_ORG} --app ${APP} ${CRED}
