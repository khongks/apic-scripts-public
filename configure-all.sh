## Ref: https://www.ibm.com/support/knowledgecenter/SSMNED_2018/com.ibm.apic.cliref.doc/apic.html
## Ref: https://openwhisk.ng.bluemix.net/api/v1/web/API%20Connect%20Native_apic-on-prem/default/index.http
## Ref: https://github.com/ibm-apiconnect/example-toolkit-scripts

## Configure you environment variables
. ./env.vars

## Login to cloud admin
./login-cmc.sh

## Configure mail server and notification
./mail-servers/create.sh
./cloud-settings/configure-mail-server.sh

## Create topology - 1 x analytics service, 1 x portal service, 1 x gateway service
## ./topology/create-analytics-service.sh
## ./topology/create-portal-service.sh
## ./topology/create-gateway-service.sh

## By default, in Cloud Pak for Integration, the only LUR include in the API Manager is ibm-cloud-private.
## If you don't have an LDAP and wishes to create your own user, you need to add api-manager-lur as one of the user registry.
# ./user-registry-settings/update-user-registry-settings.sh

## In CP4I, you need to setup the visibility for api-manager-lur to public
LUR_NAME="api-manager-lur"
./user-registries/set-visibility ${LUR_NAME} "admin" "public"

## Create a provider organization owner user
OWNER_USERNAME="khongks"
OWNER_PASSWORD="passw0rd"
OWNER_FIRSTNAME="Kok Sing"
OWNER_LASTNAME="Khong"
OWNER_EMAIL="kskhong@au1.ibm.com"
./users/create.sh ${OWNER_USERNAME} ${OWNER_PASSWORD} ${OWNER_FIRSTNAME} ${OWNER_LASTNAME} ${OWNER_EMAIL} ${LUR_NAME} "admin"

## Create a provider organization
ORG_NAME="IBM"
./orgs/create.sh ${ORG_NAME} ${OWNER_NAME} ${LUR_NAME}

## Logout cloud admin ui
./logout.sh

####################################################

## Login to provider organization
PROVIDER_REALM="provider/default-idp-2"
./login-mgr.sh ${OWNER_NAME} ${OWNER_PASSWORD} ${PROVIDER_REALM}

## Create a catalog
CATALOG_NAME="Test"
./catalogs/create.sh ${ORG_NAME} ${CATALOG_NAME} ${OWNER_USERNAME} ${LUR_NAME}

## Assign gateway service to catalog
## ./configured-gateway-service/create-configured-gateway-service.sh

## Create portal
PORTAL_SERVICE_NAME="portal-service"
./catalog-settings/create-portal.sh ${CATALOG_NAME} ${ORG_NAME} ${PORTAL_SERVICE_NAME}

## Create user for consumer org
CORG_OWNER_USERNAME="nigel"
CORG_OWNER_PASSWORD="passw0rd"
CORG_OWNER_FIRSTNAME="Nigel"
CORG_OWNER_LASTNAME="Khong"
CORG_OWNER_EMAIL="nigelkhong@gmail.com"
CATALOG_LUR_NAME="Test-catalog-0"
./users/create.sh ${CORG_OWNER_USERNAME} ${CORG_OWNER_PASSWORD} ${CORG_OWNER_FIRSTNAME} ${CORG_OWNER_LASTNAME} ${CORG_OWNER_EMAIL} ${CATALOG_LUR_NAME} ${ORG_NAME}
# ./users/create.sh nigel passw0rd Nigel Khong nigelkhong@gmail.com Test-catalog-0 IBM

## Create consumer org
CONSUMER_ORG_NAME="abc"
./consumer-orgs/create.sh ${CONSUMER_ORG_NAME} ${CATALOG_NAME} ${ORG_NAME} ${CORG_OWNER_USERNAME} ${CATALOG_LUR_NAME}

## Create application
APP_NAME="Sample App"
./apps/create.sh ${APP_NAME} ${CONSUMER_ORG_NAME} ${CATALOG_NAME} ${ORG_NAME}

## Go to sample folder
cd sample

## Import all the products in Draft mode
PRODUCT_FILE="weather-provider_1.0.0.yaml"
../draft-products/create.sh ${PRODUCT_FILE} ${ORG_NAME}

## Publish product for testing
SCOPE="catalog"
../products/publish.sh ${PRODUCT_FILE} ${CATALOG_NAME} ${ORG_NAME} ${SCOPE}

## Exit sample folder
cd ..

## Subscribe to product
PRODUCT_NAME="weather-provider"
PRODUCT_VERSION="1.0.0"
PLAN_NAME="default-plan"
./subscriptions/create.sh ${APP_NAME} ${PRODUCT_NAME} ${PRODUCT_VERSION} ${PLAN_NAME} ${CONSUMER_ORG_NAME} ${CATALOG_NAME} ${ORG_NAME}

## Test

## Logout provider organization
./logout.sh