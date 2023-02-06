#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/./env.vars

echo Logout
${APIC_CLI} logout -s $CLOUD_ADMIN_SERVER