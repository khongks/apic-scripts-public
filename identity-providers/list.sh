. ./env.vars

SCOPE=${1:-admin}

${APIC_CLI} identity-providers:list -s ${CMC_SERVER} --scope ${SCOPE} --format json