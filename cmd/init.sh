#!/bin/bash

S_DIR=".spread"

function init() {
    DIR=$(pwd)/${S_DIR}
    if [ -n "$1" ]; then
        DIR=$1
    fi

    if [ -d "${S_DIR}" ]; then
        echo "\"${S_DIR}\" already exists"
        exit 1
    fi

    mkdir -p ${DIR}
    git init --bare ${DIR}/git
    echo "Created empty Spread repository at ${DIR}"
}
