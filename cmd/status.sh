CmdNames+=('status')

# statusCommand returns information about the current spread project status
function statusCommand() {
    if [ -z "${SPREAD}" ]; then
        echo "Not in a spread repository."
        exit
    fi

    echo "Currently in spread repository '${SPREAD}'"
}
