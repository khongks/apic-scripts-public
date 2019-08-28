. ../env.vars

catalog_name=$1
apic-slim catalogs:get -s ${PORG_SERVER} -o ${PORG_NAME} ${catalog_name}
