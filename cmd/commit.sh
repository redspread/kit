CmdNames+=('commit')

# commitCommand wraps 'git commit'
function commitCommand() {
    # ensure git is setup
    requireGit

    # Run requested command with correct config
    ${GIT} commit $@
}
