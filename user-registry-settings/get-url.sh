#!/bin/bash

DIR=$(dirname $0)
. ${DIR}/../env.vars

$DIR/get.sh | jq -r .url