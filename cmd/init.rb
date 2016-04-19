class InitCmd
    def name
        "init"
    end

    def cmd(args, opts)
        setupProject
    end
end

# add to commands
cmd = InitCmd.new
Commands[cmd.name] = cmd.method(:cmd)
