## Ref: https://www.ibm.com/support/knowledgecenter/SSMNED_2018/com.ibm.apic.cliref.doc/apic.html
## Ref: https://openwhisk.ng.bluemix.net/api/v1/web/API%20Connect%20Native_apic-on-prem/default/index.http
## Ref: https://github.com/ibm-apiconnect/example-toolkit-scripts

## Configure you environment variables
. ./env.vars

## Login to cloud admin ui
./login-cmc.sh

## Configure mail server and notification
./mail-server/create-mail-server.sh
./cloud-settings/update-cloud-settings.sh

## Create topology - 1 x analytics service, 1 x portal service, 1 x gateway service
./topology/create-analytics-service.sh
./topology/create-portal-service.sh
./topology/create-gateway-service.sh

## By default, in Cloud Pak for Integration, the only LUR include in the API Manager is ibm-cloud-private.
## If you don't have an LDAP and wishes to create your own user, you need to add api-manager-lur as one of the user registry.
./user-registry-settings/update-user-registry-settings.sh

## Create a providoer organization owner user
./user/create-user.sh

## Create a provider organization
./provider-org/create-provider-org.sh

## Logout cloud admin ui
./logout.sh

## Login to provider organization (api manager)
./login-mgr.sh

## Create a catalog
./catalog/create-catalog.sh

## Assign gateway service to catalog
./configured-gateway-service/create-configured-gateway-service.sh

## Go to api-product folder
cd ./api-product

## Import all the products in Draft mode
../draft/create-draft-product.sh weather-provider_1.0.0.yaml
../draft/create-draft-product.sh jwt-product_1.0.0.yaml

## Publish product for testing
../product/publish-product.sh weather-provider_1.0.0.yaml
../product/publish-product.sh jwt-product_1.0.0.yaml

## Test
./test-weather.sh

## Exit api-product folder
cd ..

## Logout provider organization
./logout.sh
