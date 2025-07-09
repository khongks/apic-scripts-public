#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars 

REG_NAME=${1:-ace-registration}

apic registrations:get ${REG_NAME} --server ${CMC_SERVER} --output -
