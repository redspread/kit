require 'open3'

# deploy attempts to recreate the given state on the connected cluster. It does this by first trying to create the object.A
# If 'replace' is true, then it will try to replace the object if it already exits in the cluster.
# false is returned if the operation is successful
def deploy(data, replace=false, force=false)
    err = runWithData("kubectl create -f -", data)
    if err
        if existsErr?(err) && replace
            return replace(data, force)
        end
        return "could not create object: #{err}"
    end
    return false
end

# replace attempts to modify an existing object within a cluster
# if 
# false is returned if the operation is successful
def replace(data, force=false)
    args = ""
    if force
        args += "--force" 
    end

    cmd = "kubectl replace -f - #{args}"
    err = runWithData(cmd, data)
    if err
        return "could not replace object: #{err}"
    end
    return false
end

# existsErr? returns true when the provided error is because the object already exists.
def existsErr?(err)
    err.end_with?("already exists\n")
end

# runWithData runs command specified in 'cmd' and writes 'data' to it's STDIN
# It returns false if there is no error.
def runWithData(cmd, data)
    err, status = Open3.capture2e(cmd, :stdin_data => data)
    if status != 0
        return err
    end
    return false
end
