#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars 

apic registrations:create --server ${CMC_SERVER} registration.json
