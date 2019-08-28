. ../env.vars
FILE=$1.yaml
if [[ -f "$FILE" ]]; then
  rm ./$FILE 
fi
apic-slim mail-servers:get -o admin -s ${CLOUD_ADMIN_SERVER} $1
