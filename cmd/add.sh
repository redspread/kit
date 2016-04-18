#!/bin/bash

# Register name
CmdNames+=('add')

function addCommand() {
    # ensure git is available
    requireGit

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

    # insert JSON representation of object into Git
    # Keep the hash it is stored under in $OBJID
    OBJID=$(echo "${JSON}" | ${GIT} hash-object -w --stdin)

    # Stage JSON into index using $OBJID
    ${GIT} update-index --add --cacheinfo 100644 ${OBJID} "${NAMESPACE}/${OBJECT}"
}
