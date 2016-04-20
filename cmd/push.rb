class PushCmd
    def name
        "push"
    end

    def cmd(args, opts)
        # ensure git is available
        requireGit
        setupWorkdir

        argText = args.join('" "')
        puts `#{Git} push #{argText}`
    end
end

# add to commands
cmd = PushCmd.new
Commands[cmd.name] = cmd.method(:cmd)
