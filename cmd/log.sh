CmdNames+=('log')

# logCommand wraps 'git log'
function logCommand() {
    # ensure git is setup
    requireGit

    # Run requested command with correct config
    ${GIT} log $@
}
