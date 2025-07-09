#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

${APIC_CLI} cloud-settings:update -s ${CMC_SERVER} ${1}