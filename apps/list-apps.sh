. ../env.vars

DIR="$(cd "$(dirname "$0")" && pwd)"

apic-slim apps:list -s ${PORG_SERVER} -o thinker --scope org --consumer-org newton --catalog test
