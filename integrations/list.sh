#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

SUB_COLLECTION=$1

${APIC_CLI} integrations:list -s ${CMC_SERVER} --subcollection ${SUB_COLLECTION}