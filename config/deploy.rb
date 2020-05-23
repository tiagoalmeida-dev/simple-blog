lock "~> 3.13.0"

set :application, "coffee-break"
set :repo_url, "https://github.com/wevnasc/coffee-break.git"

set :deploy_to, "/home/deploy/#{fetch :application}"

set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }

append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "vendor/bundle", ".bundle", "public/uploads"

set :keep_releases, 5

