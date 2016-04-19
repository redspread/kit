CmdNames+=('remote')

# remoteCommand wraps 'git remote'
function remoteCommand() {
    # ensure git is setup
    requireGit

    # Run requested command with correct config
    ${GIT} remote $@
}
