# Recursively climbs directory tree until root looking for SpreadDir
# This is similar to the behavior of '.git'
def detectSpread(dir)
    possible = "#{dir}/#{SpreadDir}"
    if File.directory?(possible)
        return possible
    end

    parent = File.expand_path("..", dir)
    if dir == parent
        return false
    end

    detectSpread parent
end

def setupProject(wd=Dir.pwd)
    dir = "#{wd}/#{SpreadDir}"

    # check if directory already exists
    if File.directory?(dir)
        puts "#{dir} already exists"
        exit 1
    end

    # create directory
    Dir.mkdir(dir)

    # setup git
    gitDir = "#{dir}/git"
    `git init --bare #{gitDir}`
    if !$?.success?
        puts "failed to setup project"
        exit 1
    end

    puts "Created empty Spread repository at #{dir}"
end
