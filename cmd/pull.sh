CmdNames+=('pull')

# pullCommand wraps 'git pull'
function pullCommand() {
    # ensure git is setup
    requireGit

    # Run requested command with correct config
    ${GIT} pull $@
}
