# Setup git to return spread repo if repo exists
def setupGit(spreadDir=Spread)
    # GitDir is the directory that the bare Git repo is stored in
    gitDir = "#{spreadDir}/git"
    if File.directory?(gitDir)
        return "git --git-dir=#{gitDir}"
    end
    return false
end

def requireGit
    if !defined? Git
        puts "Git repository has not been configured"
        if !defined? Spread
            puts "Spread project has not been setup"
        end
        exit 1
    end
end

def setupWorkdir
    ENV["GIT_WORK_TREE"] = "./.spread"
end

def gitListFiles(ref)
    objs = `#{Git} ls-tree --name-only -r #{ref}`
    if !$?.success?
        return false
    end

    return objs
end

def gitGetFile(ref, path)
    data = `#{Git} show #{ref}:#{path}`
    if !$?.success?
        return false
    end

    return data
end
