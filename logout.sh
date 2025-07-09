#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/./env.vars

echo Logout
${APIC_CLI} logout -s $CMC_SERVER