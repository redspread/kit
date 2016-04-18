# gitCommand provides a wrapper around git setup for the spread project Git dir
function gitCommand() {
    # ensure git is setup
    requireGit

    # Run requested command with correct config
    ${GIT} $@
}
