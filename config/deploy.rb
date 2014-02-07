require "bundler/capistrano"
require 'capistrano/ext/multistage'
require "rvm/capistrano"

set :rvm_ruby_string, 'ruby-2.0.0@bikepeddler'
set :rvm_type, :user
set :rvm_autolibs_flag, "enable"
set :rvm_install_with_sudo, true
set :default_branch, "rails4"
set :application, "bikepeddler"
set :repository,  "git@github.com:bryanus/bikepeddler.git"
set :scm, :git
set :deploy_to,    "/home/deployer/#{application}"
set :deploy_via,   :remote_cache
set :use_sudo,     false
set :stages,       %w(staging production)
set :default_stage, "staging"
#set :rails_env,    'production'
ssh_options[:forward_agent] = true
ssh_options[:username]      = 'deployer'
ssh_options[:keys] = ["bikepeddler.pem"]
default_run_options[:pty] = true
before 'deploy:setup', 'rvm:install_rvm'
before 'deploy:setup', 'rvm:install_ruby'
after "deploy", "rvm:trust_rvmrc"
after "deploy:finalize_update", 'deploy:symlink_db'
after 'deploy:setup', 'deploy:install_passenger'
after "deploy:restart", "deploy:cleanup"

namespace :deploy do
  desc "Symlinks the application.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  end
  task :install_passenger, :roles => :app do
    run "gem install passenger"
  end
end

namespace :rvm do
  task :trust_rvmrc do
    run "rvm rvmrc trust #{release_path}"
  end
end

namespace :deploy do
  task :start, :roles => :app do
    run "cd #{current_path}; bundle exec passenger start -p 5011 -d -e #{rails_env}"
  end

  task :stop, :roles => :app do
    run "cd #{current_path}; bundle exec passenger stop -p 5011;"
  end

  task :restart, :roles => :app do
    stop
    start
  end
end

# old deploy code to digitalocean

# set :stages, ["staging", "production"]
# set :default_stage, "staging"

# # server settings moved to respective stage environments in /deploy/env.rb

# after "deploy", "deploy:cleanup" # keep only the last 5 releases

# namespace :deploy do

        
#   %w[start stop restart].each do |command|
#     desc "#{command} unicorn server"
#     task command, roles: :app, except: {no_release: true} do
#       run "/etc/init.d/unicorn_#{application} #{command}"
#     end
#     desc "reload the database with seed data"
# 	  task :seed do
# 	    run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
# 	  end
#     desc "precompile assets"
#     task :precompile, :roles => :web, :except => { :no_release => true } do
#           from = source.next_revision(current_revision)
#           if releases.length <= 1 || capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
#             run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
#           else
#             logger.info "Skipping asset pre-compilation because there were no asset changes"
#           end
#       end
#   end

#   task :setup_config, roles: :app do
#     sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
#     sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
#     run "mkdir -p #{shared_path}/config"
#     put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
#     puts "Now edit the config files in #{shared_path}."
#   end
#   after "deploy:setup", "deploy:setup_config"

#   task :symlink_config, roles: :app do
#     run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
#   end
#   after "deploy:finalize_update", "deploy:symlink_config"

#   desc "Make sure local git is in sync with remote."
#   task :check_revision, roles: :web do
#     unless `git rev-parse HEAD` == `git rev-parse origin/master`
#       puts "WARNING: HEAD is not the same as origin/master"
#       puts "Run `git push` to sync changes."
#       exit
#     end
#   end
#   before "deploy", "deploy:check_revision"
# end