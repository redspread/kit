class PushCmd
    def name
        "push"
    end

    def cmd(args, opts)
        # ensure git is available
        requireGit
        setupWorkdir

        argText = args.join('" "')
        out = `#{Git} push \"#{argText}\" 2>&1`
        out = out.gsub! 'github.com', 'redspread.com'
        puts out.gsub! '.git', '.spread'
    end
end

# add to commands
cmd = PushCmd.new
Commands[cmd.name] = cmd.method(:cmd)
