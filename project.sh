# Recursively climbs directory tree until root looking for a ${S_DIR}.
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
        unset SPREAD
        return
    fi

    detectSpread ${PARENT}
}