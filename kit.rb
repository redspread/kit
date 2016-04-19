#!/usr/bin/env ruby -rubygems

# spread repo directory name
SpreadDir = ".spread"

require 'rubygems'

# cli lib
require 'commander/import'

# kit helpers
require_relative './project.rb'
require_relative './git.rb'

# setup cli
program :name, 'kit'
program :version, '0.0.1'
program :description, 'prototypes Kubernetes versioning'

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
Dir[File.dirname(__FILE__) + '/cmd/*.rb'].each{ |file|
    require file
}
