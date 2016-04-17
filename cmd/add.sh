#!/bin/bash

function add() {
    OBJECT=$1

    # set namespace to default if unspecified
    NAMESPACE="default"
    if [ -n "$2" ]; then
        NAMESPACE=$2
    fi

    echo "Retrieving ${OBJECT} (namespace=${NAMESPACE})"
    JSON=$(kubectl --namespace ${NAMESPACE} get ${OBJECT} --export -o json)
    if [ ! $? -eq 0 ]; then
        echo "failed to retrieve"
        exit $?
    fi

    OBJID=$(echo ${JSON} | git hash-object -w --stdin)

    git update-index --add --cacheinfo 100644 ${OBJID} "${NAMESPACE}/${OBJECT}"
}
