. ../env.vars
catalog_name=$1
apic-slim configured-gateway-services:list -c $catalog_name --scope catalog -s ${PORG_SERVER} -o ${PORG_NAME}
