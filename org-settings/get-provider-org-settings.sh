. ../env.vars

porg_name=$1

apic-slim org-settings:get --server ${PORG_SERVER} -o ${porg_name}
