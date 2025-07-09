#!/bin/bash

function isResourceExist() {
    local resource_type=$1
    local resource_name=$2
    local namespace=$3

    if [ -z "$resource_type" ] || [ -z "$resource_name" ]; then
        echo "Usage: resource_exists <resource_type> <resource_name> [namespace]" >&2
        return 1
    fi

    if [ -n "$namespace" ]; then
        oc get "$resource_type" "$resource_name" -n "$namespace" &>/dev/null
    else
    # For cluster-scoped resources, no namespace is needed
        oc get "$resource_type" "$resource_name" &>/dev/null
    fi

    return $?
}

function slugify() {
  iconv -t ascii//TRANSLIT \
  | tr -d "'" \
  | sed -E 's/[^a-zA-Z0-9]+/-/g' \
  | sed -E 's/^-+|-+$//g' \
  | tr "[:upper:]" "[:lower:]"
}
