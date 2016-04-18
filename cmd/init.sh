CmdNames+=('init')

function initCommand() {
    DIR=$(pwd)/${S_DIR}
    if [ -n "$1" ]; then
        DIR=$1
    fi

    if [ -d "${DIR}" ]; then
        echo "\"${DIR}\" already exists"
        exit 1
    fi

    mkdir -p ${DIR}
    git init --bare --quiet ${DIR}/git
    echo "Created empty Spread repository at ${DIR}"
}
