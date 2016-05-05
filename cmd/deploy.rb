class DeployCmd
    def name
        "deploy"
    end

    def cmd(args, opts)
        requireGit

        force = false
        if args.length < 1
            puts "a reference must be specified"
            exit 1
        elsif args.length == 2 && args[1] == "-f"
            force = true
        elsif args.length == 0
            puts "kit deploy <ref> [-f]"
            puts "-f force replace"
        end

        ref = args[0]
        files = gitListFiles(ref)
        if !files
            puts "could not list files"
            exit 1
        end

        for f in files.split(/\n/)
            puts "Deploying #{f}"
            data = gitGetFile(ref, f)
            if !data
                puts "could not deploy #{f}"
                exit 1
            end

            data = cleanClusterIP(data)

            err = deploy(data, true, force)
            if err
                puts "Could not deploy #{f}: #{err}"
            end
        end
    end
end

def cleanClusterIP(data)
    data.gsub('\u003cunknown\u003e', 'None')
end

# add to commands
cmd = DeployCmd.new
Commands[cmd.name] = cmd.method(:cmd)
