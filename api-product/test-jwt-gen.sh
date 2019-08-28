. ../env.vars
curl -k -i -H "iss-claim: https://myidp.ibm.com" -H "aud-claim: ClientID1" ${GATEWAY_API_ENDPOINT_BASE}/${PORG_NAME}/${CATALOG_NAME}/jwt/gen
