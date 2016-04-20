class PullCmd
    def name
        "pull"
    end

    def cmd(args, opts)
        # ensure git is available
        requireGit
        setupWorkdir

        argText = args.join('" "')
        puts `#{Git} pull #{argText}`
    end
end

# add to commands
cmd = PullCmd.new
Commands[cmd.name] = cmd.method(:cmd)
