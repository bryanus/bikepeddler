server "ec2-54-219-23-161.us-west-1.compute.amazonaws.com", :web, :app, :db, primary: true

set :rails_env,  'production'
# set :application, "heavypeddler"
# set :user, "username"
# set :port, 22
# set :deploy_to, "/home/#{user}/apps/#{application}"
# set :deploy_via, :remote_cache
# set :use_sudo, false

# set :scm, "git"
# set :repository, "git@github.com:bryanus/bikepeddler.git"
# set :branch, "multistage"


# default_run_options[:pty] = true
# ssh_options[:forward_agent] = true