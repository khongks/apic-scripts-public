. ../env.vars

APP_NAME=$1

echo ${APP_NAME}

DIR="$(cd "$(dirname "$0")" && pwd)"

apic-slim apps:get -s ${PORG_SERVER} -o thinker --consumer-org newton --catalog test ${APP_NAME}
