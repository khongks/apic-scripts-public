#!/bin/bash
. ../env.vars

apic-slim me:get -s $CLOUD_ADMIN_SERVER --output -
