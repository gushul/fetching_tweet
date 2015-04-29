# Load DSL and set up stages
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'
require 'capistrano3/ubuntu-server-prepare'
require 'capistrano3/unicorn'
require 'capistrano/nginx'
# require 'capistrano/rvm'
require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/rails/migrations'
require 'capistrano/rails/assets'
require 'capistrano/foreman'

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }