. ../env.vars

APP_YAML_FILE=$1

DIR="$(cd "$(dirname "$0")" && pwd)"

apic-slim apps:create -s ${PORG_SERVER} -o thinker --consumer-org newton --catalog test ${APP_YAML_FILE}
