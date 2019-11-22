. ../env.vars
## product_name=weather-provider:1.0.0
product_name=$1
apic-slim products:delete -s ${PORG_SERVER} -o ${PORG_NAME} -c ${CATALOG_NAME} --scope catalog ${product_name}
