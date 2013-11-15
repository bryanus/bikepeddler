require "bundler/capistrano"
require "rvm/capistrano"
require 'capistrano/ext/multistage'

#set deploy environments and default to staging; now you have to specify env when deploying, ie 'cap staging deploy'
set :stages, ["staging", "production"]
set :default_stage, "staging"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases

