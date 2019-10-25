. ../env.vars

catalog_name=$1
apic-slim catalog-settings:get -s ${PORG_SERVER} -o ${PORG_NAME} -c ${catalog_name}
