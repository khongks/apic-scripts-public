. ../env.vars

catalog_name=$1
apic-slim catalogs:list -s ${PORG_SERVER} -o ${PORG_NAME} | grep ${catalog_name} | awk '{print $NF}'
