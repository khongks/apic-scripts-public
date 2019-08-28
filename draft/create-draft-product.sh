. ../env.vars

product_name=$1
apic-slim draft-products:create -o ${PORG_NAME} -s ${PORG_SERVER} ${product_name}
