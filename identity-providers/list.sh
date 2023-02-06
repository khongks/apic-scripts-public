. ./env.vars

SCOPE=${1:-admin}

${APIC_CLI} identity-providers:list -s ${CLOUD_ADMIN_SERVER} --scope ${SCOPE} --format json