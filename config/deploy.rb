# config valid only for current version of Capistrano
lock '3.6.0'

set :application, 'laraveladmin'
set :repo_url, 'git@github.com:ashokadhikari92/laraveladmin.git'

require 'date'
set :current_time, DateTime.now

namespace :environment do
    desc "Set environment variables"
    task :set_variables do
        on roles(:app) do
              puts ("--> Create environment configuration file")
              execute "cat /dev/null > #{fetch(:app_path)}/.env"
              execute "echo APP_DEBUG=#{fetch(:app_debug)} >> #{fetch(:app_path)}/.env"
        end
    end
end

namespace :composer do
    desc "Running Composer Install"
    task :install do
        on roles(:app) do
            within release_path do
                execute :composer, "install --no-dev"
                execute :composer, "dumpautoload"
            end
        end
    end
end

namespace :key do
    desc 'Generate app key'
        task :generate do
            on roles(:web) do
              within release_path do
                execute :php, "artisan key:generate"
              end
        end
    end
end

namespace :deploy do
  after :updated, "composer:install"
  after :finished, "environment:set_variables"
  after :finished, "key:generate"
end