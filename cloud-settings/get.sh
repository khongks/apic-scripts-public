#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

${APIC_CLI} cloud-settings:get -s ${CMC_SERVER} --format json --output -