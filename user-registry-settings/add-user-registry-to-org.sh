#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

# {
#     "provider_user_registry_urls": [
#         "https://cpd-cp4i.apps.ocp-3100015379-h9hg.cloud.techzone.ibm.com/integration/apis/apic/myapic/api/user-registries/aca52315-678c-4259-bf7a-dd60928f6ea3/d7680a2f-d57e-4765-9f8d-07d372b70b81",
#         "https://cpd-cp4i.apps.ocp-3100015379-h9hg.cloud.techzone.ibm.com/integration/apis/apic/myapic/api/user-registries/aca52315-678c-4259-bf7a-dd60928f6ea3/4d9ae790-ddd3-4db2-8f6e-921e3e72cac5"
#     ],
#     "provider_user_registry_default_url": "https://cpd-cp4i.apps.ocp-3100015379-h9hg.cloud.techzone.ibm.com/integration/apis/apic/myapic/api/user-registries/aca52315-678c-4259-bf7a-dd60928f6ea3/d7680a2f-d57e-4765-9f8d-07d372b70b81"
# }

USER_REGISTRY_NAME=$1
ORG_NAME=$2
NEW_URL=$(${DIR}/../user-registries/get-url.sh "${USER_REGISTRY_NAME}" "${ORG_NAME}" "${CLOUD_ADMIN_SERVER}")

admin_user_registry_urls=$(${DIR}/../user-registry-settings/get.sh | jq -r ".admin_user_registry_urls")


i=0
toAddAdmin=true
new_admin_user_registry_urls=""
while :
do

	url=$(echo $admin_user_registry_urls | jq -r ".[$i]")
	if [ $i -ne 0 ]; then
		new_admin_user_registry_urls+=","
	fi
	if [ "$url" = "null" ]; then
		new_admin_user_registry_urls+=\"$NEW_URL\"
		break;
	else
		# echo $url
		if [ $url = $NEW_URL ]; then
			echo "User registry ${USER_REGISTRY_NAME} already exist in user registry settings"
			toAddAdmin=false
			break;
		fi
		new_admin_user_registry_urls+=\"$url\"
	fi
	((i=i+1))
done;


provider_user_registry_urls=$(${DIR}/../user-registry-settings/get.sh | jq -r ".provider_user_registry_urls")

i=0
toAddProvider=true
new_provider_user_registry_urls=""
while :
do

	url=$(echo $provider_user_registry_urls | jq -r ".[$i]")
	if [ $i -ne 0 ]; then
		new_provider_user_registry_urls+=","
	fi
	if [ "$url" = "null" ]; then
		new_provider_user_registry_urls+=\"$NEW_URL\"
		break;
	else
		# echo $url
		if [ $url = $NEW_URL ]; then
			echo "User registry ${USER_REGISTRY_NAME} already exist in user registry settings"
			toAddProvider=false
			break;
		fi
		new_provider_user_registry_urls+=\"$url\"
	fi
	((i=i+1))
done;

if [[ $toAddAdmin = true && $toAddProvider = true ]]; then

cat > user-registry-settings.json <<EOF
{
	"admin_user_registry_urls": [ $new_admin_user_registry_urls ],
	"admin_user_registry_default_url": $NEW_URL,
    "provider_user_registry_urls": [ $new_provider_user_registry_urls ],
    "provider_user_registry_default_url": "$NEW_URL"
}
EOF
cat user-registry-settings.json
${APIC_CLI} user-registry-settings:update -s ${CLOUD_ADMIN_SERVER} user-registry-settings.json
rm user-registry-settings.json

elif [[ $toAddAdmin = true && $toAddProvider = false ]]; then

cat > user-registry-settings.json <<EOF
{
	"admin_user_registry_urls": [ $new_admin_user_registry_urls ],
	"admin_user_registry_default_url": $NEW_URL
}
EOF
cat user-registry-settings.json
${APIC_CLI} user-registry-settings:update -s ${CLOUD_ADMIN_SERVER} user-registry-settings.json
rm user-registry-settings.json

elif [[ $toAddAdmin = false && $toAddProvider = true ]]; then

cat > user-registry-settings.json <<EOF
{
    "provider_user_registry_urls": [ $new_provider_user_registry_urls ],
    "provider_user_registry_default_url": "$NEW_URL"
}
EOF
cat user-registry-settings.json
${APIC_CLI} user-registry-settings:update -s ${CLOUD_ADMIN_SERVER} user-registry-settings.json
rm user-registry-settings.json

else
	echo "Not addded"
fi
