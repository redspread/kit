# Setup Git to use spread repo if spread repo exists
function setupGit() {
    GIT_DIR=${SPREAD}/git

    # Git requires a worktree specified for some commands
    export GIT_WORK_TREE=.

    if [ -d "${GIT_DIR}" ]; then
    	GIT="git --git-dir=${GIT_DIR}"
    fi
}

function requireGit() {
	if [ -z "$GIT" ]; then
		echo "Git repository has not been configured."
		if [ -z "$SPREAD" ]; then
			echo "Spread project has not been setup"
		fi
		exit 1
	fi
}