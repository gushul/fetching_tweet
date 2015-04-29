# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'application'
set :repo_url, 'git@github.com:gushul/fetching_tweet.git'
# set :rails_env, 'production'

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/application.yml', 'config/secrets.yml')

set :unicorn_config_path, "#{current_path}/config/production/unicorn/unicorn.rb"
set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/sitemaps')
namespace :deploy do
  task :setup do
    before "deploy:migration", :create_db
    invoke :deploy
  end

  task :create_db do
    on roles(:all) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:create"
        end
      end
    end
  end
  task :migration do
    on roles(:all) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:migrate"
        end
      end
    end
  end
  task :restart do
  end
end

after 'deploy', 'deploy:restart'
after 'deploy:restart',  'unicorn:reload'
after 'deploy:restart', 'unicorn:restart'
after 'deploy:restart', 'unicorn:duplicate'
after 'deploy:restart', 'sidekiq:stop'
after 'deploy:restart', 'sidekiq:start'
