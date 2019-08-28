. ./env.vars
echo Logging in as $CLOUD_ADMIN_USER
apic-slim login -r $CLOUD_ADMIN_REALM -s $CLOUD_ADMIN_SERVER -u $CLOUD_ADMIN_USER -p $CLOUD_ADMIN_PASS
