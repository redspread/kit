class CommitCmd
    def name
        "commit"
    end

    def cmd(args, opts)
        # ensure git is available
        requireGit

        argText = args.join('" "')
        puts `#{Git} commit \"#{argText}\"`
    end
end

# add to commands
cmd = CommitCmd.new
Commands[cmd.name] = cmd.method(:cmd)
