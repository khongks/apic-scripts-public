#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

CATALOG_NAME=$1
ORG_NAME=$2

LIMIT=50
OFFSET=0

DONE=false

rm -f events.json

while [[ !DONE ]]; do

  RESPONSE=$(apic -m analytics events:orgList --catalog_name ${CATALOG_NAME} --org ${ORG_NAME} --server ${APIMGR_SERVER} --analytics-service ${ANALYTICS_SERVICE_NAME} --format json --limit ${LIMIT} --offset ${OFFSET})

  TOTAL=$(echo ${RESPONSE} | jq -r '.total') 
 
  EVENTS=$(echo ${RESPONSE} | jq -r '.events')
  echo ${EVENTS} | jq  >> events.json

  ((OFFSET=OFFSET+LIMIT))

  if (( ${OFFSET} > ${TOTAL} )); then
     DONE=true
     break
  fi
  
done

echo "Total records : $(cat events.json | jq .[].global_transaction_id | wc -l)"
