class CommitCmd
    def name
        "commit"
    end

    def cmd(args, opts)
        # ensure git is available
        requireGit
        setupWorkdir

        argText = args.join('" "')
        out = `#{Git} commit \"#{argText}\"`
        puts out.gsub! 'file', 'object'
    end
end

# add to commands
cmd = CommitCmd.new
Commands[cmd.name] = cmd.method(:cmd)
