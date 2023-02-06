#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

${APIC_CLI} services:list-all -s ${APIMGR_SERVER} 