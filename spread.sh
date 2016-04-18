#!/bin/bash

# spread repo directory name
S_DIR=".spread"

# Directory script is in
SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# recursively climbs directory tree until root looking for a ${S_DIR}.
# This is similar to the behavior of .git
# $SPREAD will be set if a project is found.
function detectSpread() {
    DIR=$1
    if [ -d "${DIR}/${S_DIR}" ]; then
        SPREAD=${DIR}/${S_DIR}
        return
    fi
    PARENT=$(dirname ${DIR})

    # if "/" then stop
    if [ ${DIR} == ${PARENT} ]; then
        return
    fi

    detectSpread ${PARENT}
}

# detect spread project
detectSpread $(pwd)

# load commands
for file in ${SRC_DIR}/cmd/*.sh; do
    source $file
done

eval $@
