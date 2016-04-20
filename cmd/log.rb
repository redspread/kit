class LogCmd
    def name
        "log"
    end

    def cmd(args, opts)
        # ensure git is available
        requireGit

        argText = args.join('" "')
        puts `#{Git} log \"#{argText}\"`
    end
end

# add to commands
cmd = LogCmd.new
Commands[cmd.name] = cmd.method(:cmd)
