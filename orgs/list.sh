#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars
. ${DIR}/../common/common.sh

${APIC_CLI} orgs:list --server ${CMC_SERVER}