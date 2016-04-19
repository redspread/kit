CmdNames+=('push')

# pushCommand wraps 'git push'
function pushCommand() {
    # ensure git is setup
    requireGit

    # Run requested command with correct config
    ${GIT} push $@
}
