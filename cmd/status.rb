class StatusCmd
    def name
        "status"
    end

    def cmd(args, opts)
        if !defined? Spread
            puts "Not in a Spread repo."
            exit 1
        end

        puts "Currently in Spread repo '#{Spread}'"
    end
end

# add to commands
cmd = StatusCmd.new
Commands[cmd.name] = cmd.method(:cmd)
