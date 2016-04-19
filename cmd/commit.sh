CmdNames+=('commit')

# commitCommand wraps 'git commit'
function commitCommand() {
    # ensure git is setup
    requireGit

    # Git requires a worktree specified to commit
    export GIT_WORK_TREE=.

    # Run requested command with correct config
    ${GIT} commit $@
}
