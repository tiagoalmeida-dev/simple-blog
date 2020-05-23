require "capistrano/setup"
require "capistrano/deploy"
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

require 'capistrano/rails'
require 'capistrano/passenger'
require 'capistrano/rbenv'
require "whenever/capistrano"
require 'capistrano/sitemap_generator'

set :rbenv_type, :user
set :rbenv_ruby, '2.6.5'
set :sitemap_roles, :web

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
