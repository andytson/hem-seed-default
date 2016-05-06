set :stages, %w(dev int uat systest production)
set :default_stage, "dev"

require 'capistrano/ext/multistage'
require 'inviqa_cap/composer'
require 'inviqa_cap/interactive'
require 'inviqa_cap/notify_slack'
require 'inviqa_cap/notify_newrelic'

set :repository, "{{git_url}}"
set :scm, :git
set :user, "deploy"
set :deploy_via, :remote_cache
set :use_sudo, false
set :keep_releases, 5

set :linked_files, [ ]
set :linked_directories, [ ]

after "deploy:finalize_update", "deploy:cleanup"
