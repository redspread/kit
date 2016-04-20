class GitCmd
    def name
        "git"
    end

    def cmd(args, opts)
        # ensure git is available
        requireGit
        setupWorkdir

        argText = args.join('" "')
        puts `#{Git} \"#{argText}\"`
    end
end

# add to commands
cmd = GitCmd.new
Commands[cmd.name] = cmd.method(:cmd)
