#!/usr/bin/env ruby -rubygems

# spread repo directory name
SpreadDir = ".spread"

# kit helpers
require_relative './project.rb'
require_relative './git.rb'

# check if working directory is inside spread project
spread = detectSpread Dir.pwd
if spread
    Spread = spread
    # defines Git function
    git = setupGit Spread
    if git
        Git = git
    end
end

# load commands
Commands = {}
Dir[File.dirname(__FILE__) + '/cmd/*.rb'].each{ |file|
    require file
}

cmd = ARGV[0]
args = ARGV[1..-1]
Commands[cmd].call(args, nil)
