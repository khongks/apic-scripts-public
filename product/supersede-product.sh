. ../env.vars

old_product_name=$1
new_product_name=$2
new_product_file=$3

DIR="$(cd "$(dirname "$0")" && pwd)"

file_name=supersede.yaml
product_url=$($DIR/get-product-url.sh ${old_product_name})

echo "Generating ./${file_name} file."
cat >./${file_name} <<EOF
product_url: ${product_url}
plans:
  - source: default
    target: default
EOF
cat ./${file_name}

$DIR/stage-product.sh ${new_product_file}

apic-slim products:supersede -s ${PORG_SERVER} -o ${PORG_NAME} -c ${CATALOG_NAME} --scope catalog ${new_product_name} ./${file_name}
