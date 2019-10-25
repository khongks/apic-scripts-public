. ../env.vars
product_file=$1
apic-slim products:publish -s ${PORG_SERVER} -o ${PORG_NAME} -c ${CATALOG_NAME} --scope catalog --stage ${product_file}
