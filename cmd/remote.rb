class RemoteCmd
    def name
        "remote"
    end

    def cmd(args, opts)
        # ensure git is available
        requireGit

        argText = args.join('" "')
        puts `#{Git} remote \"#{argText}\"`
    end
end

# add to commands
cmd = RemoteCmd.new
Commands[cmd.name] = cmd.method(:cmd)
