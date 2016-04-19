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
