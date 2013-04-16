require 'bundler/capistrano'

set :application, "portal"
set :domain,      "www.casebbers.net"
set :repository,  "git://github.com/Eat-and-Drive/portal.git"
set :use_sudo,    false
set :deploy_to,   "/srv/railsapps/#{application}"
set :scm,         "git"
set :user,        "eatdrive"
set :port,        "2287"
set :scm_password, ""

role :app, domain
role :web, domain
role :db,  domain, :primary => true

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
  
  desc "Symlink database.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{latest_release}/config/database.yml"
  end
end

after "deploy:update_code", "deploy:migrate"
before "deploy:assets:precompile", "deploy:symlink_db"
