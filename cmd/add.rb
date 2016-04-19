require 'rubygems'
require 'commander/import'

command :add do |c|
    c.syntax = 'kit add [options]'
    c.summary = 'stages object to Git index'
    c.description = 'Add allows Kubernetes objects to be staged into the Git index'
    c.example 'stage service to index', 'kit add services/kubernetes'
    c.option '-ns', '--namespace STRING', String, 'namespace to query Kubernete with'
    c.action do |args, options|
        options.default :namespace => 'default'

        if args.length < 1
            puts "A resource must be specified"
            exit 1
        end

        # ensure git is available
        requireGit

        object = args[0]

        puts "Retrieving #{object} (namespace=#{options.namespace})"
        out = `kubectl --namespace #{options.namespace} get #{object} --export -o json`
        json = out.gsub(/\s+/, "")
        if $?.to_i != 0
            puts "failed to retrieve"
            exit $?.to_i
        end

        # insert JSON representation of object into Git
        # Keep the hash it is stored under in objid
        objid = `printf "#{json}" | #{Git} hash-object -w --stdin`

        # Stage JSON into index using objid
        puts `#{Git} update-index --add --cacheinfo 100644 "#{objid}" #{options.namespace}/#{object}`
    end
end
