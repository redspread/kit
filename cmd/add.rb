class AddCmd
    def name
        "add"
    end

    def cmd(args, opts)
        namespace = "default"
        if args.length < 1
            puts "A resource must be specified"
            exit 1
        elsif args.length == 2
            namespace = args[1]
        end

        # ensure git is available
        requireGit

        object = args[0]

        puts "Retrieving #{object} (namespace=#{namespace})"
        out = `kubectl --namespace #{namespace} get #{object} --export -o json`
        json = out.gsub(/\s+/, "")
        if !$?.success?
            puts "failed to retrieve"
            exit $?.to_i
        end

        # insert JSON representation of object into Git
        # Keep the hash it is stored under in objid
        objid = `printf "#{json}" | #{Git} hash-object -w --stdin`

        # Stage JSON into index using objid
        puts `#{Git} update-index --add --cacheinfo 100644 "#{objid}" #{namespace}/#{object}`
    end
end

# add to commands
cmd = AddCmd.new
Commands[cmd.name] = cmd.method(:cmd)
