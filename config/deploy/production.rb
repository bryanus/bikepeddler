server "162.243.132.194", :web, :app, :db, primary: true

set :application, "heavypeddler"
set :user, "username"
set :port, 22
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:bryanus/bikepeddler.git"
set :branch, "multistage"


default_run_options[:pty] = true
ssh_options[:forward_agent] = true # required to deploy for some reason, even though I am not forwarding from my mac currently