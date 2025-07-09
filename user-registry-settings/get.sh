#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

${APIC_CLI} user-registry-settings:get -s ${CMC_SERVER} --format json --output -